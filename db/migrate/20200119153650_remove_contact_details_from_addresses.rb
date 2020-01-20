class RemoveContactDetailsFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :addresses, :contact_detail, foreign_key: true
  end
end
