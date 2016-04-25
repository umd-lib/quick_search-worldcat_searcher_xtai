$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quick_search_arxiv_searcher/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quick_search-arxiv_searcher"
  s.version     = QuickSearchArxivSearcher::VERSION
  s.authors     = ["Kevin Beswick"]
  s.email       = ["kdbeswic@ncsu.edu"]
  s.homepage    = "http://search.lib.ncsu.edu"
  s.summary     = "arXiv searcher for QuickSearch"
  s.description = "arXiv searcher gem engine plugin for QuickSearch"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "quick_search-core", '~> 0'
  s.add_dependency "nokogiri", '~> 1.6'

end
