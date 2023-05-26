require "active/dbml/version"
require "active/dbml/engine"

module Active
  module Dbml
    def self.export_dbml(export_path)
      dbml_file = File.new(export_path, 'w+')
      models = get_model_list
      dbml = generate_dbml(models)
      dbml_file.puts(dbml)
    end

    def self.generate_dbml(models)
      dbml_output = []
      # 出力済みのEnumを追跡
      enums_generated = Set.new

      models.each do |model|
        if ActiveRecord::Base.connection.table_exists?(model.table_name)
          primary_key = get_primary_key(model)
          foreign_keys = get_foreign_keys(model)

          dbml_output << "Table #{model.table_name} {"

          # Enumを取得
          defined_enums = model.defined_enums.keys

          # カラム情報を生成
          generate_columns(dbml_output, model, primary_key, foreign_keys, defined_enums)

          # Index情報の取得
          generate_indexes(dbml_output, model)

          # テーブルコメントの取得
          generate_table_comment(dbml_output, model)

          # テーブルを閉じる
          dbml_output << "}\n"

          # Enumの詳細を取得
          generate_enums(dbml_output, model, enums_generated)
        end
      end

      dbml_output.join("\n")
    end

    private
    def self.get_primary_key(model)
      model.primary_key
    end

    def self.get_foreign_keys(model)
      foreign_keys = {}

      model.reflect_on_all_associations.each do |association|
        case association.macro
        when :belongs_to
          foreign_key = association.options[:foreign_key]
          foreign_key_destination = "#{association.plural_name}.#{association.class_name.constantize.primary_key}"

          association.class_name.constantize.reflect_on_all_associations.each do |relation_association|
            if model.table_name.eql?(relation_association.plural_name)
              case relation_association.macro
              when :has_one
                foreign_keys[foreign_key] = { destination: foreign_key_destination, relation_type: '-' }
              when :has_many
                foreign_keys[foreign_key] = { destination: foreign_key_destination, relation_type: '>' }
              else
              end
            end
          end
        end
      end

      foreign_keys
    end

    def self.generate_columns(dbml_output, model, primary_key, foreign_keys, defined_enums)
      model.columns.each do |column|
        options = []
        options.push 'pk' if primary_key.eql?(column.name)
        options.push 'not null' if !column.null
        options.push "note: '#{column.comment}'" if column.comment.present?
        options.push "ref: #{foreign_keys[column.name][:relation_type]} #{foreign_keys[column.name][:destination]}" if foreign_keys.key?(column.name)

        unless defined_enums.include?(column.name)
          dbml_output << "  #{column.name} #{check_sql_type(column.sql_type)} #{"[#{options.join(', ')}]" if options.present?}"
        else
          dbml_output << "  #{column.name} #{column.name} #{"[#{options.join(', ')}]" if options.present?}"
        end
      end
    end

    def self.generate_indexes(dbml_output, model)
      indexes = model.connection.indexes(model.table_name)
      if indexes.present?
        dbml_output << "\n  Indexes {"
        indexes.each do |index|
          dbml_output << "    #{index.columns[0]} [name: '#{index.name}']"
        end
        dbml_output << "  }"
      end
    end

    def self.generate_table_comment(dbml_output, model)
      table_comment = model.connection.table_comment(model.table_name)
      if table_comment.present?
        dbml_output << "\n  Note: '# #{table_comment}'"
      end
    end

    def self.generate_enums(dbml_output, model, enums_generated)
      model.defined_enums.each do |key, value|
        # Enumがまだ出力されていない場合のみ出力
        if key.present? && !enums_generated.include?(key)
          dbml_output << "Enum #{key} {"
          value.keys.each do |value_key|
            dbml_output << "  #{value_key}"
          end

          dbml_output << "}\n"
          # Enumを出力済みとして記録
          enums_generated.add(key)
        end
      end
    end

    def self.check_sql_type(sql_type)
      case sql_type
        when 'tinyint(1)'
          return 'boolean'
        when 'datetime(6)'
          return 'datetime'
        else
          return sql_type
      end
    end

    def self.get_model_list
      Rails.application.eager_load! unless Rails.configuration.cache_classes
      # ApplicationRecord.descendants
      ActiveRecord::Base.descendants
    end
  end
end
