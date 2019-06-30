# app/controllers/api/v1/items/most_items_controller.rb

class Api::V1::Items::MostItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.most_items(item_params[:quantity]))
  end

  private

  def item_params
    params.permit(:quantity)
  end

end
