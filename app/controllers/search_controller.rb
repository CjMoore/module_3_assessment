class SearchController < ApplicationController

  def index
    @stores = Store.create(params[:search])
    @total = Store.total(params[:search])
  end
end
