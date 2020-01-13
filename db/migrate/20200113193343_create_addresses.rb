class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.integer :street_number
      t.string :city
      t.string :country
      t.integer :postal_code

      t.timestamps
    end
  end
end
