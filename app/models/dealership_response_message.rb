class DealershipMessage < ActiveRecord::Base
  belongs_to :dealership_message
  belongs_to :dealership_contact

  validates_presence_of :message_body

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
