class DealershipMessage < ActiveRecord::Base
  belongs_to :dealership
  has_many :cars
  has_one :dealership_response_message

  enum message_type: { Lead: 0, Problem: 1, Service: 2, Specials: 3 }
  validates_presence_of :message_body, :message_type

  before_save :create_bitly_links

  private

  def create_bitly_links
    client = Bitly.client
    self.message_body.split(' ').each do |word|
      if(word.match(/(https?:\/\/)?\w*\.\w+(\.\w+)*(\/\w+)*(\.\w*)?/))
        @url = client.shorten(word)
        self.message_body.gsub!(word, @url.short_url)
      end
    end
  end
end
