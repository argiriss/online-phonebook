class AddContactDetailReferenceToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :contact_detail, foreign_key: true
  end
end
