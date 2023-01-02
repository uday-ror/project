# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:show_all_carts]

  def index
    @coffees = Coffee.order(:name).page params[:page]
  end

  def show_all_carts
    @user_cart_coffee = current_user.items.pluck(:coffee_id) 
  end

  def search
    if params[:search].blank?  
     redirect_to root_path
    else
      @coffees = Coffee.where("name LIKE ?","%#{params[:search]}%").order(:name).page 
    end
  end
end


