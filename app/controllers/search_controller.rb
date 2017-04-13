class SearchController < ApplicationController

  def index
    @stores = Store.create(params[:search])
  end
end
