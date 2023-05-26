class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :user_id
      t.bigint :article_id

      t.string :comment

      t.timestamps

      t.index :user_id
      t.index :article_id
    end
  end
end
