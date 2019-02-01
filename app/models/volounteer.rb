class Volounteer < ApplicationRecord
  has_secure_password
  has_many :group_volounteers
  has_many :groups, through: :group_volounteers

  validates :username,
          presence: true,
          uniqueness: { case_sensitive: false }

  validates :password,
            presence: true


  def authenticate(plaintext_password)
    if BCrypt::Password.new(self.password_digest) == plaintext_password
      self
    else
      false
    end
  end 




end
