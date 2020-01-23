class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin], multiple: false)                                      ##
  ############################################################################################ 
 
  validate :must_have_at_most_five_featured
  validates_presence_of :contact_detail, :addresses

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  acts_as_paranoid

  has_one :contact_detail
  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :addresses, 
                                allow_destroy: true

  accepts_nested_attributes_for :contact_detail,
                                allow_destroy: true
  
  scope :members, -> { where.not(confirmed_at: nil) }
  scope :featured, -> { where(featured: true) }

  def more_than_five_featured_members?
    User.featured.size > 5
  end

  def full_name
    contact_detail.first_name + " " + contact_detail.last_name
  end

  private 
  def must_have_at_most_five_featured
    errors.add :user, "Featured members can not be more than 5" if more_than_five_featured_members?
  end
end
