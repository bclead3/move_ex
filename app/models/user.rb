class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i  # from  http://www.regular-expressions.info/regexbuddy/email.html

  has_one :address
  has_many :user_attributes

  before_save :email_downcase
  before_create :create_remember_token

  validates :name, presence: true
  validates :email, presence: true, format:{ with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def add_pair(key,value)
    kv_object = UserAttribute.create( user_id:self.id, key:key, value:value )
  end

  def remove_pair(key)
    kv_object = UserAttribute.where( user_id:self.id, key:key).first
    kv_object.user_id = nil
    kv_object.save
    kv_object
  end

  def get_value_from_key(key)
    UserAttribute.where( user_id: self.id, key: key).first.value
  end

  def get_keys
    key_array = UserAttribute.where( user_id: self.id)
  end

  def has_keys?
    ! UserAttribute.where( user_id: self.id).empty?
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt( value )
    Digest::SHA1.hexdigest( value.to_s)
  end


  private

  def email_downcase
    if email.present?
      self.email = email.downcase
    end
  end

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end