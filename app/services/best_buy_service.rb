class BestBuyService
  def initialize
    @_conn = Faraday.new(url: 'http://api.bestbuy.com/') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def search_by_description(description)
    response = conn.get do |req|
      req.url "/v1/products(longDescription=#{description}*)"
      req.params['show'] = "customerReviewAverage,shortDescription,name,sku,salePrice,image"
      req.params['pageSize'] = 15
      req.params['apiKey'] = ENV['BESTBUY_API']
      req.params['format'] = 'json'
    end
    parse_response(response)[:products]
  end

  private
    def parse_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      @_conn
    end
end
