class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :memberships
  has_many :projects, through: :memberships

  def full_name
    "#{first_name} #{last_name}"
  end
end
