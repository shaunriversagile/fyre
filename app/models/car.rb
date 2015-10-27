class Car < ActiveRecord::Base 

  belongs_to :dealership
  belongs_to :dealership_message
  has_many :car_prospects
  has_many :prospects, through: :car_prospects

  before_save :create_bitly_link

  def create_bitly_link
    client = Bitly.client
    @bitly_link = client.shorten(self.link)
    self.bitly_link = @bitly_link.short_url
  end

end 