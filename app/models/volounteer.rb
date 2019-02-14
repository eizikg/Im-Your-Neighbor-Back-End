class Volounteer < ApplicationRecord
  has_secure_password
  acts_as_mappable
  has_many :group_volounteers, dependent: :destroy
  has_many :groups, through: :group_volounteers
  has_one :neighborhood



  before_save :downcase_email

  validates :email,
          presence: true,
          uniqueness: { case_sensitive: false } , on: :create

  validates :password,
            presence: true, on: :create

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end


end
