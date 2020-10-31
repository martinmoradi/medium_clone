class CreatePmAssigments < ActiveRecord::Migration[6.0]
  def change
    create_table :pm_assigments do |t|
      t.references :recipient, null: false, foreign_key: true
      t.references :private_message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
