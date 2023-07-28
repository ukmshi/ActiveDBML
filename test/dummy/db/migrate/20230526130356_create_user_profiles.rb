class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.bigint :user_id

      t.integer :age, default: 0
      t.string  :sex_code, default: '01'
      t.timestamps

      t.index :user_id
    end
  end
end
