# frozen_string_literal: true

require 'rails_helper'

describe CoffeesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let(:coffee) { FactoryBot.create(:coffee) }
  let(:coffees) { create_list :coffee, 3 }

  before do
    sign_in(user)
  end

  # add user card action
  describe 'POST #add_user_card' do
    let!(:item) { FactoryBot.create(:item, coffee: coffee) }

    before do
      post :add_user_card, params: { id: coffee.id }
    end

    it 'is expected to create new item successfully' do
      expect(item.save).to eq true
      expect(response).to redirect_to(show_all_carts_path)
    end

    it 'is expected to increase item  quantity successfully' do
      expect(response.status).to eq(302)
    end

    it 'is expected to have quantity 1 if new item is added to cart' do
      post :add_user_card, params: { id: coffee.id }
      expect(assigns(:item).quantity).to eq(2)
    end
  end

  # remove user card action
  describe 'DELETE #remove_user_card' do
    let!(:item) { FactoryBot.create(:item, coffee: coffee) }

    before do
      delete :remove_user_card, params: { id: coffee.id }
    end

    it 'is expected to increase item  quantity successfully' do
      delete :remove_user_card, params: { id: coffee.id }
      expect(response.status).to eq(302)
    end

    it 'is expected to have quantity decrease by 1 if item already present to cart' do
      expect(item.quantity).to eq(1)
    end

    it 'user cart items not present' do
     expect(assigns(item.quantity)).to be nil
     expect(response.status).to eq(302)
     expect(flash[:notice]).to eq('Cart item is empty.')
    end
  end
end
