#!/usr/bin/env ruby
require_relative 'loghelper'
require 'date'

log = []
errors = []
puts "Apache Access Log Parser"

if !ARGV[0]
	puts "Usage: parse.rb <access.log>"
	exit(1)
end

File.open(ARGV[0]).each do |line|
	log_hash = log_to_hash(line)
	log << log_hash
end

# Seperate Errors / Successful Requests
errors = log.select { |requests| requests[:status] != "200" && requests[:status] != "304" && requests[:status] != "301" }
success = log.select { |requests| requests[:status] == "200" || requests[:status] == "304" || requests[:status] == "301" }

# Find the Total Number of Minutes in the Log
# Subtracting Dates Provide Number of Days between them
# Convert to Hours by multiplying days by 24, Then Minutes
# By Multiplying a further 60, If you want seconds you can do another 60
minutes = ((log.last[:time] - log.first[:time]) * 24 * 60).to_i
success_rpm = success.count / minutes
errors_rpm = errors.count / minutes

bytes_sent = 0
total_response_time = 0

log.each do |request|
	bytes_sent += request[:size].to_i
	total_response_time += request[:request_time].to_i
end

kilobytes_sent = bytes_sent / 1024
megabytes_sent = kilobytes_sent / 1024

puts "Total Requests : #{log.count}"
puts "Successful RPM : #{success_rpm}"
puts "Error RPM      : #{errors_rpm}"
puts "Total MB Sent  : #{megabytes_sent}mb (#{bytes_sent} bytes)"
puts "Mean Response  : #{total_response_time / log.count}µs"
