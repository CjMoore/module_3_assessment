class Api::V1::ItemsController < ApplicationController

  def index
    render status: 200, json: Item.all
  end

  def show
    render status: 200, json: Item.find(params[:id])
  end

  def destroy
    Item.delete(params[:id])
    render nothing: true, status: 204
  end

end
