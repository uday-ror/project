# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:coffee) { FactoryBot.create(:coffee) }
  let!(:order) { FactoryBot.create(:order) }
  let!(:item) do
    user.items.create(itemable_id: user.id, itemable_type: 'user', coffee_id: coffee.id, quantity: 2)
  end
  let(:orders) { create_list :order, 3 }
  it 'should be present' do
    expect(order.id).to eq(1)
    expect(user.id).to eq(1)
    expect(coffee.id).to eq(1)
    expect(item.save).to be true
  end

  describe 'orders' do
    describe 'GET orders#index' do
      it 'Get# displays order of user' do
        sign_in(user)
        get :index
        expect(response.status).to eq(200)
      end
    end

    describe 'GET# orders#new' do
      it 'should render orders#new ' do
        expect(response.status).to eq(200)
      end
    end

    describe 'Post# orders#create' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:order) { FactoryBot.create(:order) }
      context 'when the user items exits' do
        it 'order can be created' do
          expect(order.save).to eq true
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'GET# orders#show' do
      before do
        get :show, params: {id: order.id}
      end

      it 'show the order details' do
        expect(response.status).to eq(302)
      end
    end
  end
end
