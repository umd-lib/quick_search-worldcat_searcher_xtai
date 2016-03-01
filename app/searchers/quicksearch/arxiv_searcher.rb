module Quicksearch
  class ArxivSearcher < Quicksearch::Searcher

    def search
      url = base_url + parameters.to_query
      raw_response = @http.get(url)
      @response = Nokogiri::XML(raw_response.body)
    end

    def results
      if results_list
        results_list
      else
        @results_list = []
        @response.xpath('//xmlns:entry').each do |value|
          result = OpenStruct.new

          result.title = title(value)
          puts result.title
          result.link = link(value)
          puts result.link
          result.author = author(value)
          puts result.author
          result.date = published(value)
          puts result.date
          result.journal_ref = journal(value)
          puts result.journal_ref

          @results_list << result
        end
        @results_list
      end
    end

    def total
      @response.xpath('//opensearch:totalResults', 'opensearch' => 'http://a9.com/-/spec/opensearch/1.1/')[0].content
    end

    def loaded_link
      ARXIV_CONFIG['loaded_link']
    end

    private

    def location(value)
      location = ''
      unless value.xpath('*//xmlns:holdingsItem').blank?
        if value.xpath('*//xmlns:holdingsItem').size > 1
          location << "Multiple Locations"
        else
          holdings_item = value.xpath('*//xmlns:holdingsItem')
          location << value.xpath('*//xmlns:library').attribute('name')
          location << " #{holdings_item.at('callNumber').content}"
        end
      end
    end

    def base_url
      ARXIV_CONFIG['base_url']
    end

    def parameters
      {
        'search_query' => 'all:' + http_request_queries['not_escaped'],
        'start'=> @offset,
        'max_results' => @per_page
      }
    end

    def title(value)
      value.at('title').content if value.at('title')
    end

    def link(value)
      value.at("link[@rel='alternate']").attributes['href'].value if value.at("link[@rel='alternate']")
    end

    def author(value)
      authors = []
      value.search('author/name').children.each do |a|
        authors << a.content
      end
      authors.join(', ')
    end

    def published(value)
      datetime = value.at('published').content if value.at('published')
      d = Time.zone.parse(datetime)
      d.strftime('%Y')
    end

    def journal(value)
      value.at('arxiv:journal_ref').content if value.at('arxiv:journal_ref')
    end


  end
end
