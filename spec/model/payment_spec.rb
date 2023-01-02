# frozen_string_literal: true

require 'rails_helper'

describe Payment, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:order) { FactoryBot.create(:order) }
  let!(:payment) { FactoryBot.create(:payment) }

  it 'can be created' do
    expect(payment.save).to be true
    expect(order.save).to be true
    expect(user.save).to be true
  end

  before { subject.save }

  it 'card_number not present ' do
    subject.card_number =  nil
    expect(subject).to_not be_valid
  end

  it 'card_number should be present ' do
    subject.card_number = 1_212_334_564_234_451
    subject.cvc = 1234
    subject.user_id = 1
    subject.order_id = 1
    expect(subject).to be_valid
  end

  it 'cvc  not present' do
    subject.cvc = nil
    expect(subject).to_not be_valid
  end

  it 'cvc should be present' do
    subject.card_number = 1_212_334_564_234_451
    subject.cvc = 1234
    subject.user_id = 1
    subject.order_id = 1
    expect(subject).to be_valid
  end

  it 'card_number should not to be long ' do
    subject.card_number = '1' * 16
    expect(subject).to_not be_valid
  end

  it 'cvc should not be long' do
    subject.cvc = '1' * 4
    expect(subject).to_not be_valid
  end
end
