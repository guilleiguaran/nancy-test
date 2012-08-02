# name, description, address, phone number, email, web site, nit
class Merchant < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :address, :presence => true
  validates :phone, :presence => true
end
