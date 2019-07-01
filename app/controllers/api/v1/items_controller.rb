# app/controllers/api/v1/items_controller.rb

class Api::V1::ItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.find_all(item_params))
  end

  def show
    render json: ItemSerializer.new(Item.find_by(item_params))
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
