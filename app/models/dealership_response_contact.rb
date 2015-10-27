class DealershipResponseContact < ActiveRecord::Base
  belongs_to :dealership_response_message
  belongs_to :dealership_contact

end