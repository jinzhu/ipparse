# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "ipparse"
  s.version     = "0.2.0"
  s.authors     = ["Jinzhu"]
  s.email       = ["wosmvp@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{IPParse: simple tool to convert ip to address}
  s.description = %q{IPParse: simple tool to convert ip to address}

  s.rubyforge_project = "ipparse"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
