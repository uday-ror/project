# frozen_string_literal: true

require 'rails_helper'

describe Coffee, type: :model do
  let(:coffee) { FactoryBot.create(:coffee) }
 
  it 'can be created' do
    expect(coffee.save).to be true
  end 
   
  before { subject.save }

  it 'name should not present ' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present ' do
    subject.name = 'black'
    subject.amount = 1000
    expect(subject).to be_valid
  end

  it 'amount should not present ' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present ' do
    subject.amount = 1000
    subject.name = 'black'
    expect(subject).to be_valid
  end
end
