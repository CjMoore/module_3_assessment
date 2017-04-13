class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: Item.all, except: [:created_at, :updated_at]
  end

  def show
    render status: 200, json: Item.find(params[:id]), except: [:created_at, :updated_at]
  end

  def destroy
    Item.delete(params[:id])
    render nothing: true, status: 204
  end

  def create
    render status: 201, json: Item.create(item_params), except: [:created_at, :updated_at]
  end

  private

  def item_params
    params.require(:item).permit(:name, :image_url, :description)
  end
end
