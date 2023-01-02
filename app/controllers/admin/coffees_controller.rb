# frozen_string_literal: true

module Admin
  class CoffeesController < Admin::AdminsController
    before_action :set_coffee, only: %i[show edit update destroy]
    before_action :authenticate_user! 

    def index
      @coffees = Coffee.all
    end

    def show
      @coffee = Coffee.find(params[:id])
    end

    def new
      @coffee = Coffee.new
    end

    def create
      @coffee = Coffee.new(coffee_params)
      if @coffee.save
        redirect_to [:admin, @coffee]
      else
        render :new
      end
    end

    def edit
      @coffee = Coffee.find(params[:id])
    end

    def update

      @coffee = Coffee.find(params[:id])
      if @coffee.update(coffee_params)
        redirect_to admin_coffee_path
      else
        render :edit
      end
    end

    def destroy
      @coffee.destroy
      redirect_to admin_coffees_path
    end

    def search
      if params[:search].blank?  
       redirect_to admin_root_path
      elsif
       @users = User.joins(:orders).where("email LIKE ?","%"+params[:search]+"%").distinct
      # @users = User.joins(:orders).where('created_at BETWEEN ? AND ?', params[:search])
      # @users = User.joins(:orders).where("DATE(created_at = (?)" , params[:search]).distinct
      end
    end


    private

    def set_coffee
      @coffee = Coffee.find(params[:id])
    end

    def coffee_params
      params.require(:coffee).permit(:name, :amount, :detail, :image)
    end
  end
end
