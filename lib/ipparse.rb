$KCODE = 'UTF8'
# IPV4
class IPParse
  @@data    ||= []

  def self.parse(ip)
    return false unless ip.to_s =~ /(\d+\.){3}\d+/
    ip,addr = format(ip) , ''

    [ip[0,3].to_i,0].each do |f|
      @@data[f] ||= file_to_a("#{File.dirname(__FILE__)}/../data/#{f}.txt")
      addr = dichotomizing(@@data[f],ip)
      return addr if addr
    end

    return "UNKNOW"
  end

  protected
  def self.dichotomizing(arg,ip)
    cen  = arg.size/2
    cur  = arg[cen]

    # arg.size = 0 || 1
    return (cur && (cur[0,15]..cur[16,15]).include?(ip)) ? cur[32...-1] : false  if cen == 0
    return dichotomizing(arg[0...cen],ip)        if cur[0,15]  > ip
    return dichotomizing(arg[cen+1..-1],ip)      if cur[16,15] < ip
    return arg[cen][32...-1]
  end

  def self.format(ip)
    ip.to_s.scan(/\d+/).map{|x| x.rjust(3, '0')}.join('.')
  end

  def self.file_to_a(f)
    File.exist?(f) ? File.open(f){|m| m.to_a} : []
  end
end
