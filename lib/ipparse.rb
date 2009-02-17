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
   cen = (arg.length/2).to_i
   x = arg[cen].split(/\s+/,3)

   return (x[0]..x[1]).include?(ip) ? x[2] : false if arg.size == 1
   return dichotomizing(arg[0...cen],ip)           if x[0] > ip
   return dichotomizing(arg[cen...arg.length],ip)  if x[1] < ip
   return x[2]
  end

  def self.format(ip)
    ip.to_s.split('.').inject([]) do |s,x|
      s << [('%03s' % x).gsub(/ /,'0')]
    end.join('.')
  end
end
