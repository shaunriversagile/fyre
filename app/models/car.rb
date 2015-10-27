class Car < ActiveRecord::Base 

  belongs_to :dealership
  belongs_to :dealership_message
  has_many :car_prospects
  has_many :prospects, through: :car_prospects 

end 