Rails.application.routes.draw do

  mount QuickSearchArxivSearcher::Engine => "/quick_search_arxiv_searcher"
end
