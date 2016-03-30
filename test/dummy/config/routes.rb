Rails.application.routes.draw do

  mount QuickSearchArxivSearcher::Engine => "/quicksearch_arxiv_searcher"
end
