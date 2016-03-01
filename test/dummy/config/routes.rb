Rails.application.routes.draw do

  mount QuicksearchArxivSearcher::Engine => "/quicksearch_arxiv_searcher"
end
