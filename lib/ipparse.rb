# IPV4
class IPParse
  def self.parse(ip)
    return false unless ip =~ /(\d+\.){3}\d+/
    ip,addr = format(ip) , ''

    [ip.split('.')[0],'0'].each do |f|
      f = File.join(File.dirname(__FILE__),'..','data',f+'.txt')
      tmpip = (f =~ /0\.txt/ ? ip : ip[4,ip.length-1])
      File.open(f).each do |x|
        x = x.split(/\s+/,3)
        return x[2].strip if (format(x[0])..format(x[1])).include?(tmpip)
      end if File.exist?(f)
    end

    return "UNKNOW"
  end

  protected
  def self.format(ip)
    ip.to_s.gsub(/\*/,'255').split('.').inject([]) do |s,x|
      s << [('%03s' % x).gsub(/ /,'0')]
    end.join('.')
  end
end
