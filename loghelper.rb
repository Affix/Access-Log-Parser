#!/usr/bin/env ruby
#Apache Log Helper
#Contains some Helper Methods
require 'date'

def log_to_hash(string)
  split_log = string.split
  log_hash = Hash.new
  log_hash[:ip] = split_log[0]
  log_hash[:time] = DateTime.strptime("#{split_log[3]}#{split_log[4]}",'[%d/%b/%Y:%H:%M:%S %z]')
  log_hash[:request] = "#{split_log[5]}#{split_log[6]}#{split_log[7]}"
  log_hash[:status] = split_log[8]
  log_hash[:size] = split_log[9]
  log_hash[:request_time] = split_log[10]
  log_hash
end
