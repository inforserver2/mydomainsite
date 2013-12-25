# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "#{path}/log/cron_log.log"
#
 every 1.minute do
   command "ls -la"
   runner "puts 'fuckyou'"
   rake "turn"
   command "astrails-safe -v #{path}/config/astrails.rb"
 end
#
 every 4.days do
   runner "puts 'oohh yeah'"
 end

# Learn more: http://github.com/javan/whenever
