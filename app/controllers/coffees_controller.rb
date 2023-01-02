
# frozen_string_literal: true

class CoffeesController < ApplicationController
  before_action :set_coffee, only: %i[ show add_user_card remove_user_card]
  before_action :authenticate_user!, only: %i[add_user_card remove_user_card]


  def show
  end


  def add_user_card
    item = Item.find_or_initialize_by(itemable: current_user, coffee_id: @coffee.id)
    if item.id?
      item.increment!(:quantity)
    else
      item.quantity = 1
      item.save
    end
    respond_to do |format|
      format.html { redirect_to show_all_carts_path, notice: 'Coffee. Add to Cart.' }
    end
  end

  def remove_user_card
    if current_user.items == []
      redirect_to root_path, notice: 'Cart item is empty.'
    else
      item = current_user.items.find_by(coffee_id: @coffee.id)
      if item.quantity == 1
        item.destroy
      else  
        item.decrement!(:quantity)
      end
      redirect_to show_all_carts_path
    end
  end



  private

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def coffee_params
    params.require(:coffee).permit(:name, :amount, :image)
  end
end
