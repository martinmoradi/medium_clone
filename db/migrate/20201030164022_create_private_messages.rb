class CreatePrivateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :private_messages do |t|
      t.references :sender, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
