class Api::V1::ItemsController < ApplicationController

  def index
    render status: 200, json: Item.all
  end

  def show
    render status: 200, json: Item.find(params[:id])
  end

end
