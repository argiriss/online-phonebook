class User < ApplicationRecord
  before_validation :custom_validation, if: :more_than_five_featured_members?
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  acts_as_paranoid

  scope :members, -> { where.not(confirmed_at: nil) }
  scope :featured, -> { where(featured: true) }

  def more_than_five_featured_members?
    User.featured.size > 5
  end

  private 
  def custom_validation
    errors.add :user, "Featured members can not be more than 5"
    false  
  end
end
