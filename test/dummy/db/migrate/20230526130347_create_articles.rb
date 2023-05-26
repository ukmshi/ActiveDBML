class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.bigint :user_id
      t.bigint :article_id

      t.string :title
      t.string :article_body

      t.timestamps

      t.index :user_id
      t.index :article_id
    end
  end
end
