$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quicksearch_arxiv_searcher/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quicksearch_arxiv_searcher"
  s.version     = QuicksearchArxivSearcher::VERSION
  s.authors     = ["Kevin Beswick"]
  s.email       = ["kdbeswic@ncsu.edu"]
  s.homepage    = "http://search.lib.ncsu.edu"
  s.summary     = "arXiv searcher for QuickSearch implemented as a gem engine"
  s.description = "arXiv searcher for QuickSearch implemented as a gem engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "nokogiri"

end
