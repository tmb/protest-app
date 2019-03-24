require 'twilio-ruby'

class SendTwilioMessagesJob < ApplicationJob
  queue_as :default

  account_sid = "AC9581b5bcda2ce9cf3eb4db76e57b6ed7"
  auth_token = "a6294e89d29382248297d6a47d589d15"

  client = Twilio::REST::Client.new account_sid, auth_token

  def perform(phone_numbers, message)
    phone_numbers.each do | number |
      client.api.account.messages.create
    end
  end
end
