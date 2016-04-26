class SearchesController < ApplicationController
  def index
    @results = Result.where(params[:search][:description])
  end
end
