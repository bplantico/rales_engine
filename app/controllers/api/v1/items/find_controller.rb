# app/controllers/api/v1/items/find.rb

class Api::V1::Items::FindController < ApplicationController

  def index
    if item_params[:unit_price].nil?
      render json: ItemSerializer.new(Item.find_all(item_params))
    else
      unformatted_price = item_params[:unit_price]
      db_formatted_price = ((unformatted_price.to_f*100).round(0))
      render json: ItemSerializer.new(Item.find_all(unit_price: db_formatted_price))
    end
  end

  def show
    if item_params[:unit_price].nil?
      render json: ItemSerializer.new(Item.find_all(item_params).limit(1).take)
    else
      unformatted_price = item_params[:unit_price]
      db_formatted_price = ((unformatted_price.to_f*100).round(0))
      render json: ItemSerializer.new(Item.find_by(unit_price: db_formatted_price))
    end
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
