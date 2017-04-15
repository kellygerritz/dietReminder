#!/usr/bin/env ruby

require 'twilio-ruby'

account_sid = ARGV[0]
auth_token = ARGV[1]

chosen_line = nil

File.foreach("reasons.txt").each_with_index do |line, number|
  chosen_line = line if rand < 1.0/(number+1)
end

motivation = "Reason to lose weight:\n#{chosen_line}\nRemember to sit while eating\n Give yourself credit"

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => motivation,
                                          :to => ARGV[2],
                                          :from => ARGV[3])
