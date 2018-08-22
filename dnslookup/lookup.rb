#!/usr/bin/env ruby

require 'socket'

hostname = ARGV[0]
ip = IPSocket.getaddress(hostname)
puts "#{hostname}: #{ip}"
