class Address < ActiveRecord::Base
  belongs_to :user

  extend AddressesHelper

  def to_s
    "#{self.address_1}#{self.address_2.nil? ? '' : ' '+self.address_2}, #{self.city} #{self.state}\t#{self.postal_code}"
  end
end
