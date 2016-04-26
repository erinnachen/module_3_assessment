class Result
  attr_reader :sku, :name, :avg_review, :short_desc, :image_url, :sale_price

  def initialize(data)
    @sku = data[:sku]
    @name = data[:name]
    @avg_review = data[:customerReviewAverage]
    @short_desc = data[:shortDescription]
    @image_url = data[:image]
    @sale_price = data[:salePrice]
  end

  def self.where(description)
    service.search_by_description(description).map {|result_data|
      Result.new(result_data)
    }
  end

  private
    def self.service
      BestBuyService.new
    end
end
