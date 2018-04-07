# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "motomo-middleman"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matthias Guenther"]
  s.email       = ["matze@wikimatze.de"]
  s.homepage    = "https://github.com/wikimatze/motomo-middleman"
  s.summary     = %q{Add tracking code for motomo}
  s.description = %q{Add tracking code for motomo}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.extra_rdoc_files = ['README.md']

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 4.2.1"])
end
