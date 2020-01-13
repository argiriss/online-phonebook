class ContactDetail < ApplicationRecord
  belongs_to :user
  has_many :address
end
