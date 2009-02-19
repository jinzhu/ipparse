# IP Data from PHPWind
system("find #{File.dirname(__FILE__)}/../data -iname '*txt' -exec dos2unix \{\} \\;")

def format(ip)
  ip.to_s.gsub(/\*/,'255').scan(/\d+/).map{|x| x.rjust(3, '0')}.join('.')
end

file = Dir.new("#{File.dirname(__FILE__)}/../data").find.to_a.select {|x| x =~ /\w/}

file.map do |z|
  currentfile = File.open("#{File.dirname(__FILE__)}/../data/#{z}") {|m| m.to_a}
  prefix = (z =~ /^0\.txt$/ ? '' : z.split('.')[0].rjust(3,'0') + '.')
  tmpfile = []

  currentfile.each_with_index do |x,i|
    next if x.strip.empty?
    x = x.split(/\s+/,3)
    x[0] = prefix + format(x[0])
    x[1] = prefix + format(x[1])
    tmpfile << x.join("\s")
  end

  File.open("#{File.dirname(__FILE__)}/../data/#{z}",'w+') do |x|
    x << tmpfile
  end
end
