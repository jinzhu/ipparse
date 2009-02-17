# IP Data from PHPWind
system("find #{File.dirname(__FILE__)}/../data -iname '*txt' -exec sed -i 's/*/255/g' \{\} \\;")

def format(ip)
  ip.to_s.split('.').inject([]) do |s,x|
    s << [('%03s' % x).gsub(/ /,'0')]
  end.join('.')
end

file = Dir.new("#{File.dirname(__FILE__)}/../data").find.to_a.select {|x| x =~ /\w/}

file.map do |z|
  h = File.new("#{File.dirname(__FILE__)}/../data/#{z}").to_a
  h.each_with_index do |x,i|
    x = x.split(/\s+/,3)
    x[0] = format(x[0])
    x[1] = format(x[1])
    h[i] = x.join("\t\t")
  end

  File.open("#{File.dirname(__FILE__)}/../data/#{z}",'w+') do |x|
    x << h
  end
end
