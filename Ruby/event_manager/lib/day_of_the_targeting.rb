# frozen_string_literal: false

require 'date'
require 'csv'

# DateTime's parse method uses year/month/day format
def fix_date(date)
  date = date.split(/\D/)
  "#{date[2]}/#{date[0]}/#{date[1]} #{date[3]}:#{date[4]}"
end

def create_report(text_message)
  filename = 'registration_days_report.txt'

  File.open(filename, 'a') do |file|
    file.puts text_message
  end
end

registration_days = []
registration_days_count = {}

content = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
content.each do |line|
  registration_days << DateTime.parse(fix_date(line[:regdate])).wday
end

registration_days.sort.each do |time|
  registration_days_count[time] ||= 0
  registration_days_count[time] += 1
end

registration_days_count.each do |k, v|
  message = case k
            when 0
              "#{v} people signed up on Sunday."
            when 1
              "#{v} people signed up on Monday."
            when 2
              "#{v} people signed up on Tuesday."
            when 3
              "#{v} people signed up on Wednesday."
            when 4
              "#{v} people signed up on Thursday."
            when 5
              "#{v} people signed up on Saturday."
            else
              "#{v} people signed up on Monday."
            end

  create_report(message)
end
