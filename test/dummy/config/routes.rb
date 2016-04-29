Rails.application.routes.draw do

  mount QuicksearchWorldCatSearcher::Engine => "/quicksearch_worldcat_searcher"
end
