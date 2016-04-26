class ResultsController < ApplicationController
  def index
    @results = Result.where(description: params[:search][:description])
  end
end
