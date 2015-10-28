class DealershipResponseMessage < ActiveRecord::Base
  belongs_to :dealership_message

  has_many :dealership_response_contacts
  has_many :dealership_contacts, through: :dealership_response_contacts

  validates_presence_of :message_body

  accepts_nested_attributes_for :dealership_contact

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
