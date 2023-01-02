# frozen_string_literal: true

require 'rails_helper'

describe PaymentsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let(:coffee) { FactoryBot.create(:coffee) }
  let(:coffees) { create_list :coffee, 3 }
  let!(:order) { FactoryBot.create(:order) }
   let!(:payment) { FactoryBot.create(:payment) }
  it 'can be created' do
    expect(coffee.save).to be(true)
    expect(user.save).to be(true)
    expect(order.save).to be(true)
    expect(payment.save).to be(true)
  end

  describe 'index' do
    before do
      sign_in(user)
      get :index
    end
    it 'will be successful' do
      expect(response.status).to eq(200)
    end
  end

  describe 'Get # show' do
    before do
      get :show, params: {id: order.id}
    end

    it 'show the payment details' do
      expect(response.status).to eq(302)
    end
  end
    
  describe 'payment create' do
    let(:payment) { FactoryBot.create(:payment) }
    before do
      sign_in(user)
    end
    it 'can be created' do
      expect(payment.save).to eq true
      expect(response.status).to eq(200)
      # expect(response).to redirect_to(admin_coffees_path)
    end

    it ' payement successful created' do
       expect(response.status).to eq(200)
       # expect(response).to redirect_to(thanks_path)
    end	

    it 'can be new' do
      expect(response.status).to eq(200)
     # expect(response).to render_template(:new)
    end
  end

  it 'edit coffee ' do
    expect(response.status).to eq(200)
  end
end
