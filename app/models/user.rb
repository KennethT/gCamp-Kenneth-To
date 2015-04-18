class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships
  has_many :comments

  def full_name
    "#{first_name} #{last_name}"
  end

  def sameproject(user)
    self.projects.any? do |project|
      project.users.pluck(:user_id).include?(user.id)
    end
  end
end
