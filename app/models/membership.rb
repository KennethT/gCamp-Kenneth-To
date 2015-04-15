class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  enum role: { member: 0, owner: 1 }

  # validates :user_id, presence: true, uniqueness: true
  validates :role, presence: true
end
