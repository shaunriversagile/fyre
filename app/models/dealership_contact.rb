class DealershipContact < ActiveRecord::Base
  belongs_to :dealership
  has_many :dealership_response_contacts
  has_many :dealership_response_messages, through: :dealership_response_contacts
end