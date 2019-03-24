require 'twilio-ruby'

class SendTwilioMessagesJob < ApplicationJob
  queue_as :default

  account_sid = "AC399428ed23277a73a610de8006977b96"
  auth_token = "88d3c3f99e192fd7d3e406ef0b4a021b"

  FROM_NUMBER = "+17743714212"

  CLIENT = Twilio::REST::Client.new account_sid, auth_token

  def perform(phone_numbers, theMessage)
    phone_numbers.each do | number |
      CLIENT.api.account.messages.create(
          from: FROM_NUMBER,
          to: number,
          body: theMessage
        )
    end
  end
end
