class CreateContactDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_details do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.integer :telephone
      t.integer :mobile
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
