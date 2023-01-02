# frozen_string_literal: true

# require 'support/factory_bot'

require 'spec_helper'
require 'rails_helper'

describe Order, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:order) { FactoryBot.create(:order, user: user) }
  let!(:coffee) { FactoryBot.create(:coffee) }
  let!(:item) do
    user.items.create(itemable_id: user.id, itemable_type: 'user', coffee_id: coffee.id, quantity: 2)
  end
  it 'can be created' do
    expect(order.save).to be true
    expect(user.save).to be true
    expect(coffee.save).to be true
    expect(item.save).to be true
  end

  before { subject.save }

  it 'permanent_address  not present ' do
    subject.permanent_address = nil
    expect(subject).to_not be_valid
  end

  it 'total should be increase ' do
    subject.total = item.quantity * coffee.amount
    subject.user_id = 1
    subject.permanent_address = 'vijay nagar,Indore'
    subject.mobile_no = 9_892_011_289
    subject.pincode = 452_003
    expect(subject).to be_valid
  end

  it 'total should not be nil ' do
    subject.total = nil
    expect(subject).to_not be_valid
  end

  it 'permanent_address should be present ' do
    subject.permanent_address = 'vijay nagar,Indore'
    subject.mobile_no = 9_892_011_289
    subject.pincode = 452_003
    subject.user_id = 1
    expect(subject).to be_valid
  end

  it 'mobile_no not present ' do
    subject.mobile_no = nil
    expect(subject).to_not be_valid
  end

  it 'mobile_no should  be present ' do
    subject.permanent_address = 'vijay nagar,Indore'
    subject.mobile_no = 9_892_011_289
    subject.pincode = 452_003
    subject.user_id = 1
    expect(subject).to be_valid
  end

  it 'pincode not present' do
    subject.pincode = nil
    expect(subject).to_not be_valid
  end

  it 'pincode should be present' do
    subject.permanent_address = 'vijay nagar,Indore'
    subject.mobile_no = 9_892_011_289
    subject.pincode = 452_003
    subject.user_id = 1
    expect(subject).to be_valid
  end

  it 'mobile_no should not to be long ' do
    subject.mobile_no = '1' * 11
    expect(subject).to_not be_valid
  end

  it 'pincode should not be long' do
    subject.pincode = '1' * 7
    expect(subject).to_not be_valid
  end

  it 'pincode should be valid' do
    subject.permanent_address = 'vijay nagar,Indore'
    subject.mobile_no = 9_892_011_289
    subject.pincode = 452_003
    subject.user_id = 1
    expect(subject).to be_valid
  end
end
