$KCODE = 'UTF8'
# IPV4
class IPParse
  def self.parse(ip)
    return false unless ip.to_s =~ /(\d+\.){3}\d+/
    ip,addr = format(ip) , ''

    [ip.split('.')[0],'0'].each do |f|
      f = File.join(File.dirname(__FILE__),'..','data',f+'.txt')
      tmpip = (f =~ /0\.txt/ ? ip : ip[4,ip.length-1])
      if File.exist?(f)
        addr = dichotomizing(File.new(f).to_a,tmpip)
        return addr.strip if addr
      end
    end

    return "UNKNOW"
  end

  protected
  def self.dichotomizing(arg,ip)
   cen = (arg.length/2).to_i
   x = arg[cen].split(/\s+/,3)

   return (format(x[0])..format(x[1])).include?(ip) ? x[2] : false if arg.size == 1
   return dichotomizing(arg[0...cen],ip)          if format(x[0]) > ip
   return dichotomizing(arg[cen...arg.length],ip) if format(x[1]) < ip
   return x[2]
  end

  def self.format(ip)
    ip.to_s.gsub(/\*/,'255').split('.').inject([]) do |s,x|
      s << [('%03s' % x).gsub(/ /,'0')]
    end.join('.')
  end
end
