# IPV4
class Ip
  def self.parse(ip)
    file,ip,addr = ip.split('.')[0] + '.txt' , format(ip) , ''

    [file,'0.txt'].each do |f|
      tmpip = (f =~ /0\.txt/ ? ip : ip[4,ip.length-1])
      File.open(File.join('data',f)).each do |x|
        x = x.split(/\s+/,3)
        return x[2] if ('%03s' % x[0]).gsub(/ /,'0') > tmpip && (format(x[0])..format(x[1])).include?(tmpip)
      end if File.exist?(File.join('data',f))
    end
    return "UNKNOW"
  end

  protected
  def self.format(ip)
    ip.gsub!(/\*/,'255')
    ip.split('.').inject([]) do |s,x|
      s << [('%03s' % x).gsub(/ /,'0')]
    end.join('.')
  end
end
