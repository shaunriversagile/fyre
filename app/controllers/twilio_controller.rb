
require 'twilio-ruby'
 
class TwilioController < ApplicationController
  include Webhookable
 
  after_filter :set_header
 
  skip_before_action :verify_authenticity_token

  def text

    message_identifier = params["Body"]
    from_number = params["From"]

    @car_requested = Car.where(stock_id: message_identifier).last

    client = Bitly.client

    #SMSLogger.log_text_message from_number, message_identifier

    twilio_sid = 'AC06d72653ea2dca08e960c186cd893355'
    twilio_auth_token = '0e3877f28f5c03ffe0bfa6bd4e9f8840'
    twilio_phone_number = "4123451223"

    #client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    #message = client.messages.create from: '4123451223', to: '4124273378', body: 'We can now text. Its hardwired to your number right now but it works.  Call this number too'

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_auth_token

    if message_identifier.downcase.include? 'problem'
      @message = DealershipMessage.where(:message_code => message_identifier).last
      @dealer_message = @message.dealership_response_message.message_body
      @dealer_number =   @message.phone_number.nil? ? Dealership.find(@message.dealership_id).phone_number : @message.phone_number

      @twilio_client.account.messages.create(:from => "+1#{twilio_phone_number}", :to => from_number, :body => @message.message_body)
      @twilio_client.account.messages.create(:from => "+1#{twilio_phone_number}", :to => @dealer_number, :body => @dealer_message)
      # " \n\n Unfortunately a customer is not completely satisfied! \n\n No worries, thanks to FYRE it is not too late! Contact #{from_number} asap to rectify any issues or concerns."

    elsif message_identifier.downcase.include? 'service'
      @message = DealershipMessage.where(:message_code => message_identifier).last
      @dealer_number = @message.phone_number.nil? ? Dealership.find(@message.dealership_id).phone_number : @message.phone_number

      @twilio_client.account.messages.create(:from => "+1#{twilio_phone_number}", :to => from_number, :body => @message.message_body)
      @twilio_client.account.messages.create(:from => "+1#{twilio_phone_number}", :to => @dealer_number, :body => " \n\nAnother service customer has taken advantage of FYRE! \n\n #{from_number} requested your service specials and can now easily schedule their service visit \n\n       A complete list of all customers using this tool will be emailed every Monday am!")

      # \n\nThank you for contacting the service department at Day Apollo Subaru!\n\n Please follow this link to take advantage of our current specials!  http://bit.ly/1jDgkFe \n\n Also, don't forget to schedule your next visit, with our easy scheduling process! http://bit.ly/1M85nSn
    elsif @car_requested.present?
      @message = @car_requested.dealership_message
      @message.message_body.gsub!('#DEALER#', @car_requested.dealership.name)
      @message.message_body.gsub!('#LINK#', @car_requested.bitly_link)
      @message.message_body.gsub!('#YEAR#', @car_requested.year)
      @message.message_body.gsub!('#MAKE#', @car_requested.make)
      @message.message_body.gsub!('#MODEL#', @car_requested.model)

      @twilio_client.account.messages.create(:from => "+1#{twilio_phone_number}", :to => from_number, :body => @message.message_body)
      @twilio_client.account.messages.create(:from => "+1#{twilio_phone_number}", :to => @car_requested.dealership.phone_number, :body => " \n\nAnother lead from Fyre!  \n\n#{from_number} texted us about the #{@car_requested.year},  #{@car_requested.make} #{@car_requested.model}. You will receive an email update with all of your leads at the end of the day.  \n\nThank you for your business")

      # " \n\nHello from #{@car_requested.dealership.name}!! \n\nThank you for your interest in the #{@car_requested.year}, #{@car_requested.make} #{@car_requested.model}. Follow this link for details and special pricing #{@car_requested.bitly_link}."

      # "\n\nHello from #DEALER#!! \n\nThank you for your interest in the #YEAR#, #MAKE# #MODEL#. Follow this link for details and special pricing #LINK#."
    else
    
        @twilio_client.account.messages.create(:from => "+1#{twilio_phone_number}", :to => from_number, :body => " \n\nHello from Used Car World!! \n\nOoops! We're sorry but your text didn't match any of our cars.  #{message_identifier} was the text that we recieved.  Please check to make sure that there are no extra spaces in your text and that the numbers are correct.  Text HELP if you would like additional help.")
        @twilio_client.account.messages.create(:from => "+1#{twilio_phone_number}", :to => '4124273378', :body => " \n\nAnother lead from Fyre!  \n\nA prospect with the number #{from_number} is on your lot and and texted us about a car but what they sent us doesnt match our records.  Usually this is because somone fat fingered a number or added a space.  Please reach out when you can.\n\nAs always, thank you for your business!")
    end

    render :nothing => true
  end 
end