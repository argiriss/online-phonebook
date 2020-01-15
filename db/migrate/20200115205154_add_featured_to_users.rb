class AddFeaturedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :featured, :boolean
  end
end
