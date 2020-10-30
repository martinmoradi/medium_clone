class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :pseudo
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :city, null: false, foreign_key: true
      t.string :password_digest
      t.integer :age
      t.text :description

      t.timestamps
    end
  end
end
