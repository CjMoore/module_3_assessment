class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: Item.all, only: [:name, :description, :image_url]
  end

  def show
    render status: 200, json: Item.find(params[:id]), only: [:name, :description, :image_url]
  end

  def destroy
    Item.delete(params[:id])
    render nothing: true, status: 204
  end

end
