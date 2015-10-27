class DealershipContact < ActiveRecord::Base
  belongs_to :dealership
  has_many :dealership_response_messages
end