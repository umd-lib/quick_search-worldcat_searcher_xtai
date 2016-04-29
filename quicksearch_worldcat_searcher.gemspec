$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quicksearch_worldcat_searcher/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quicksearch_worldcat_searcher"
  s.version     = QuicksearchWorldcatSearcher::VERSION
  s.authors     = ["Xiaoyu Tai"]
  s.email       = ["xtai@umd.edu"]
  s.homepage    = "http://www.lib.umd.edu"
  s.summary     = "WorldCat searcher for QuickSearch implemented as a gem engine"
  s.description = "WorldCat searcher for QuickSearch implemented as a gem engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "nokogiri"

end
