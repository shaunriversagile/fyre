class Dealership < ActiveRecord::Base 

  has_many :dealership_contacts
  has_many :cars
  has_many :dealership_messages

end 