# frozen_string_literal: true

class PaymentsController < ApplicationController
  
  def index
    if current_user.admin?
      @payments = Payment.all
    else
      @payments = current_user.payments
    end
  end

  def new
    @payment = Payment.new
    @user_id = params[:user_id]
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      UserMailer.order_confirmation(current_user)
      redirect_to thanks_path, notice: 'Order Completed Successfully.'
    else
      render :new
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_type, :cvc, :cc_exp_month, :card_number, :order_id, :user_id)
  end
end
