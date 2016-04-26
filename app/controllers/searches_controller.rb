class SearchesController < ApplicationController
  def index
    @results = Search.where(params[:description])
  end
end
