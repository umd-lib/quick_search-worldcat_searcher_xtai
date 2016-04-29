Rails.application.routes.draw do

  mount QuicksearchWorldcatSearcher::Engine => "/quicksearch_worldcat_searcher"
end
