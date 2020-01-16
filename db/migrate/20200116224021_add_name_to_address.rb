class AddNameToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :name, :string, before: :street_name
  end
end
