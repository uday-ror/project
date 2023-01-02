# frozen_string_literal: true

class OrdersController < ApplicationController

  def index
    if current_user.admin?
      if params[:user].nil?
        @orders = Order.all
      else
        @orders = Order.where(user_id: params[:user]).order(created_at: :desc)
      end    
    else
      @orders = current_user.orders
    end
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    if current_user.items.exists?
      @order = Order.new(order_params)
      if @order.save
        current_user.items.update(itemable_id: @order.id, itemable_type: 'Order')
        redirect_to order_path(@order)
      else
        render :new
      end
    end
  end

  def thanks; end

  private

  def order_params
    params.require(:order).permit(:total, :user_id, :address, :permanent_address, :mobile_no, :pincode)
  end
end