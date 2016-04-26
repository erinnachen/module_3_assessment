class SearchesController < ApplicationController
  def index
    @results = Result.where(params[:description])
  end
end
