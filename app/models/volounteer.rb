class Volounteer < ApplicationRecord
  has_secure_password
  has_many :group_volounteers
  has_many :groups, through: :group_volounteers

  validates :username,
          presence: true,
          uniqueness: true

validates :password,
          presence: true

end
