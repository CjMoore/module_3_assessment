class Api::V1::ItemsController < ApplicationController
  skip_before_filter :verigy_authenticity_token, if: :json_request?

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

  def create
    render status: 201, json: Item.create(item_params), only: [:name, :description, :image_url]
  end

  private

  def item_params
    params.require(:item).permit(:name, :image_url, :description)
  end

end
