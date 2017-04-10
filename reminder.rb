#!/usr/bin/env ruby

require 'twilio-ruby'

account_sid = ARGV[0]
auth_token = ARGV[1]

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Whattup bitch?",
                                          :to => ARGV[2],
                                          :from => ARGV[3])

puts message.sid
