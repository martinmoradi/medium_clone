class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :recipient, index: true
      t.references :sender, index: true
      t.text :content

      t.timestamps
    end
  end
end
