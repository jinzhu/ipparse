# -*- encoding: utf-8 -*-
require File.dirname(__FILE__) + '/lib/version'

Gem::Specification.new do |s|
  s.name = %q{ipparse}
  s.version = IPParse::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zhang Jinzhu"]
  s.date = %q{2009-02-16}
  s.default_executable = %q{ipparse}
  s.description = %q{IP Parse}
  s.email = %q{wosmvp@gmail.com}
  s.executables = ["ipparse"]
  s.extra_rdoc_files = ["lib/ipparse.rb", "lib/version.rb", "bin/ipparse"]
  s.files = ["test/test_ipparse.rb", "data/203.txt", "data/195.txt", "data/213.txt", "data/81.txt", "data/194.txt", "data/217.txt", "data/80.txt", "data/118.txt", "data/117.txt", "data/212.txt", "data/222.txt", "data/210.txt", "data/116.txt", "data/122.txt", "data/124.txt", "data/119.txt", "data/123.txt", "data/59.txt", "data/60.txt", "data/58.txt", "data/121.txt", "data/193.txt", "data/219.txt", "data/221.txt", "data/192.txt", "data/202.txt", "data/125.txt", "data/211.txt", "data/61.txt", "data/62.txt", "data/218.txt", "data/220.txt", "lib/ipparse.rb", "lib/version.rb", "Rakefile", "bin/ipparse", "Manifest", "ipparse.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://www.zhangjinzhu.com}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ipparse", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ipparse}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{IP Parse}
  s.test_files = ["test/test_ipparse.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
