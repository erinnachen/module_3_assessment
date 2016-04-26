class Api::V1::ItemsController < Api::V1::BaseController
  respond_to :json
  def index
    respond_with Item.all
  end
end
