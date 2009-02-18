$KCODE = 'UTF8'
# IPV4
class IPParse
  @@data    ||= []

  def self.parse(ip)
    return false unless ip.to_s =~ /(\d+\.){3}\d+/
    ip,addr = format(ip) , ''

    [ip[0,3].to_i,0].each do |f|
      file        = "#{File.dirname(__FILE__)}/../data/#{f.to_s}.txt"
      @@data[f] ||= File.exist?(file) ? File.new(file).to_a : false

      if @@data[f]
        addr = dichotomizing(@@data[f],f == 0 ? ip : ip[4,ip.length])
        return addr.strip if addr
      end
    end

    return "UNKNOW"
  end

  protected
  def self.dichotomizing(arg,ip)
    size = arg.size
    cen  = size/2

    # '001.053.000.000 001.153.255.255 IANA' < '001.053.000.000' + '1'
    # reduce 'string'.split call
    return dichotomizing(arg[0...cen],ip)           if size != 1 && (arg[cen] > ip + '1')
    x = arg[cen].split(/\s+/,3)
    return (x[0]..x[1]).include?(ip) ? x[2] : false if size == 1
    return dichotomizing(arg[cen...size],ip)        if x[1] < ip
    return x[2]
  end

  def self.format(ip)
    ip.to_s.split('.').inject([]) do |s,x|
      s << [('%03s' % x).gsub(/ /,'0')]
    end.join('.')
  end
end
