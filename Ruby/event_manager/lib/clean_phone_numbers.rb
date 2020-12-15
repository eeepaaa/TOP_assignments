# frozen_string_literal: false

require 'csv'
require 'erb'

def valid_phone_number(phone_number)
  phone_number = phone_number.split(/\D/).join

  return if phone_number.length < 10
  return if phone_number.length >= 11 && phone_number[0] != 1
  return if phone_number.length > 11

  if phone_number.length == 11
    phone_number[1..10]
  else
    phone_number[0..9]
  end
end

def send_text_message(first_name, text_message)
  filename = "text_messages/#{first_name}_confirmation"
  Dir.mkdir('text_messages') unless Dir.exist? 'text_messages'

  File.open(filename, 'w') do |file|
    file.puts text_message
  end
end

text_message = File.read 'text_message_template.erb'
erb_text_message = ERB.new text_message

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
contents.each do |line|
  first_name = line[:first_name].downcase.capitalize

  text_message = erb_text_message.result(binding)
  send_text_message(first_name, text_message) if valid_phone_number(line[:homephone])
end
