# frozen_string_literal: false

require 'date'
require 'csv'

# DateTime's parse method uses year/month/day format
def fix_date(date)
  date = date.split(/\D/)
  "#{date[2]}/#{date[0]}/#{date[1]} #{date[3]}:#{date[4]}"
end

def create_report(text_message)
  filename = 'registration_hours_report.txt'

  File.open(filename, 'a') do |file|
    file.puts text_message
  end
end

registration_hours = []
registration_hours_count = {}

content = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
content.each do |line|
  registration_hours << DateTime.parse(fix_date(line[:regdate])).strftime('%R')
end

registration_hours.sort.each do |time|
  time = time.split(':')[0].to_i

  registration_hours_count[time] ||= 0
  registration_hours_count[time] += 1
end

registration_hours_count.each do |k, v|
  if k < 12
    message = "#{v} people signed up at #{k} am."
  else
    k -= 12
    message = "#{v} people signed up at #{k} pm."
  end

  create_report(message)
end
