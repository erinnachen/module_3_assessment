class BestBuyService
  def initialize
    @_conn = Faraday.new(url: 'http://sushi.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  private

    def connection

    end
end
