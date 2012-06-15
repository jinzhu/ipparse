# encoding=utf-8
# IP Data from PHPWind (download it here: http://www.phpwind.com/index.php)

system("find #{File.dirname(__FILE__)}/../data -iname '*txt' -exec dos2unix \{\} \\;")

def format(ip)
  ip.to_s.gsub(/\*/,'255').scan(/\d+/).map{|x| x.rjust(3, '0')}.join('.')
end

files = Dir.new("#{File.dirname(__FILE__)}/../data").find.to_a.select {|x| x =~ /\w/}

files.map do |file|
  file_content = File.read("#{File.dirname(__FILE__)}/../data/#{file}")
  prefix = (file =~ /^0\.txt$/ ? '' : file.split('.')[0].rjust(3,'0') + '.')
  tmpfile = ""

  file_content.split("\n").map do |x|
    next if x.strip.empty?
    x = x.split(/\s+/,3)
    x[0] = prefix + format(x[0])
    x[1] = prefix + format(x[1])
    tmpfile << x.join("\s") + "\n"
  end

  File.open("#{File.dirname(__FILE__)}/../data/#{file}",'w+') do |x|
    x << tmpfile
  end
end
