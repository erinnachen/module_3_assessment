class BestBuyService
  def initialize
    @_conn = Faraday.new(url: 'http://api.bestbuy.com/') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
    set_connection_params
  end

  def get(path)
    conn.get do |req|
      req.url path
    end
  end

  def search_by_description(description)
    desc = format_description(description)
    path = "/v1/products(longDescription=#{desc}*)"
    parse_response(get(path), :products)
  end

  private
    def parse_response(response, type)
      JSON.parse(response.body, symbolize_names: true)[type]
    end

    def conn
      @_conn
    end

    def set_connection_params
      conn.params['apiKey'] = ENV['BESTBUY_API']
      conn.params['format'] = 'json'
      conn.params['show'] = "customerReviewAverage,shortDescription,name,sku,salePrice,image"
      conn.params['pageSize'] = 15
    end

    def format_description(desc)
      desc.gsub(/ /,"*%20")
    end
end
