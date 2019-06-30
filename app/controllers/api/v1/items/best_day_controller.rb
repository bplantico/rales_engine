# app/controllers/api/v1/items/best_day_controller.rb

class Api::V1::Items::BestDayController < ApplicationController


  def show
    @item = Item.find(params[:id])
    render json: BestDaySerializer.new(@item.best_day)
  end


end
