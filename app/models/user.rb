class User < ActiveRecord::Base
  has_secure_password

  before_save :email_downcase

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  private

  def email_downcase
    if email.present?
      self.email = email.downcase
    end
  end
end