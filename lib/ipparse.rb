# encoding=utf-8
$KCODE = 'UTF8' if RUBY_VERSION < '1.9'

# IPV4
class IPParse
  @@data    ||= []

  def self.parse(ip)
    return false unless ip.to_s =~ /(\d+\.){3}\d+/
    ip = ip.scan(/\d+/).map{|x| x.rjust(3, '0')}.join('.')

    return dichotomizing(@@data[ip[0,3].to_i] ||= file_to_a("#{File.dirname(__FILE__)}/../data/#{ip[0,3].to_i}.txt"),ip) ||dichotomizing(@@data[0] ||= file_to_a("#{File.dirname(__FILE__)}/../data/0.txt"),ip) || "Unknown"
  end

  protected
  def self.dichotomizing(arg,ip)
    cen  = arg.size/2
    cur  = arg[cen]

    # arg.size = 0 || 1
    return cur && cur[0,15] <= ip && cur[16,15] >= ip ? cur[32...-1] : false  if cen == 0
    return dichotomizing(arg[0...cen],ip)        if cur[0,15]  > ip
    return dichotomizing(arg[cen+1..-1],ip)      if cur[16,15] < ip
    return arg[cen][32...-1]
  end

  def self.file_to_a(f)
    File.exist?(f) ? File.open(f){|m| m.to_a} : []
  end
end
