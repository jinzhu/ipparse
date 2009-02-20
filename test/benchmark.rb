require File.join(File.dirname(__FILE__),"..","lib","ipparse.rb")
require 'benchmark'

ips = (1..100000).map { Array.new(4){|i| rand(255)}.join(".") }

Benchmark.bmbm do |x|
  x.report("IPParse") {ips.each{|ip| IPParse.parse(ip) }}
end
