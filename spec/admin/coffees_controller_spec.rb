# frozen_string_literal: true

require 'rails_helper'

describe Admin::CoffeesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let(:coffee) { FactoryBot.create(:coffee) }
  let(:coffees) { create_list :coffee, 3 }
  it 'can be created' do
    expect(coffee.save).to be(true)
    expect(user.save).to be(true)
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
      get :show, params: {id: coffee.id}
    end

    it 'show the coffee details' do
      expect(response.status).to eq(302)
    end
  end
    
  describe 'coffee create' do
    let(:coffee) { FactoryBot.create(:coffee) }
    before do
      sign_in(user)
    end
    it 'can be created' do
      expect(coffee.save).to eq true
      expect(response.status).to eq(200)
      # expect(response).to redirect_to(admin_coffees_path)
    end

    it 'can be new' do
      expect(response.status).to eq(200)
     # expect(response).to render_template(:new)
    end
  end

  it 'edit coffee ' do
    expect(response.status).to eq(200)
  end

  describe "PATCH #update" do
    it "updates the coffee" do
      patch :update, params: {id: coffee.id, name: "hgjhgjhgjh"}
      expect(response.status).to eq(302)
    end
  
    it "does not change the coffee, and re-renders the form" do
      patch :update, params: {id: coffee.id, name: nil}
      expect(Coffee.count).to eq(1)
    end
  

    it 're-renders the "edit" view' do
      expect(response.status).to eq(200)
    end
  end

  it 'delete coffee' do
    delete :destroy, params: { id: coffee.id }
    expect(response.status).to eq(302)
  end
end