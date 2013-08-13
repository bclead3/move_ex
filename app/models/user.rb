class User < ActiveRecord::Base
  has_secure_password

  has_one :address
  has_many :user_attributes

  before_save :email_downcase

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def add_pair(key,value)
    num_kv_objects = UserAttribute.where( user_id:self.id).count
    kv_object = UserAttribute.create( user_id:self.id, key:key, value:value, position:(num_kv_objects+1) )
  end

  def get_key(key)
    key_array = UserAttribute.where( user_id: self.id, key: key).first
  end

  def get_keys
    key_array = UserAttribute.where( user_id: self.id)
  end

  def has_keys?
    ! UserAttribute.where( user_id: self.id).empty?
  end

  #def set_email(email)
  #  self.email = email
  #end

  private

  def email_downcase
    if email.present?
      self.email = email.downcase
    end
  end
end