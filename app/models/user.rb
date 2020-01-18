class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin], multiple: false)                                      ##
  ############################################################################################ 
 

  before_validation :custom_validation, if: :more_than_five_featured_members?
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  acts_as_paranoid
  has_one :contact_detail, dependent: :destroy

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
