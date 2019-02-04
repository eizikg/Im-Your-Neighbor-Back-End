class Volounteer < ApplicationRecord
  has_secure_password
  has_many :group_volounteers
  has_many :groups, through: :group_volounteers
  has_one :neighborhood



  before_save :downcase_email

  validates :email,
          presence: true,
          uniqueness: { case_sensitive: false }

  validates :password,
            presence: true

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end


end
