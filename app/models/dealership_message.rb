class DealershipMessage < ActiveRecord::Base
  belongs_to :dealership
  has_many :cars

  enum message_type: { Lead: 0, Problem: 1, Service: 2 }
  validates_presence_of :message_body, :message_type

  before_save :create_bitly_links

  private

  def create_bitly_links

  end
end
