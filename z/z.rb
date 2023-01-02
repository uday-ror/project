
  private

 
  def ensure_item_present   
    if self.order.items.present?
      order.save
    end
  end



# frozen_string_literal: true

require 'rails_helper'

describe Payment, type: :model do
  subject do
    Payment.new(payment_type: 'Credit card', card_number: 1_212_334_564_234_451, cvc: 2445, itemable_id: 1)
  end

  before { subject.save }

  it 'card_number should be present ' do
    subject.card_number =  nil
    expect(subject).to_not be_valid
  end

  it 'cvc should be present' do
    subject.cvc = nil
    expect(subject).to_not be_valid
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




# frozen_string_literal: true

require 'rails_helper'

describe Coffee, type: :model do
  subject do
    Coffee.new(name: 'black', amount: 200)
  end

  before { subject.save }

  it 'name should be present ' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present ' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end



# frozen_string_literal: true
require 'rails_helper'

describe Order, type: :model do
  subject do
    Order.new(total: 1000, address: 'vijay nagar,Indore', permanent_address: 'vijay nagar,Indore', mobile_no: 9_826_034_567,
              pincode: 452_001, itemable_id: 1)
  end



  # order = create(:order)
      # user = create(:user)
      # coffee = create(:coffee)

  before { subject.save }

  it 'permanent_address should be present ' do
    subject.permanent_address =  nil
    expect(subject).to_not be_valid
  end

  it 'mobile_no should be present ' do
    subject.mobile_no =  nil
    expect(subject).to_not be_valid
  end

  it 'pincode should be present' do
    subject.pincode = nil
    expect(subject).to_not be_valid
  end

  it 'mobile_no should not to be long ' do
    subject.mobile_no = '1' * 10
    expect(subject).to_not be_valid
  end

  it 'pincode should not be long' do
    subject.pincode = '1' * 6
    expect(subject).to_not be_valid
  end
end



=======================================
  def remove_user_card                                
    if current_user.items == []

      redirect_to root_path, notice: 'First Add the coffee then can remove.'
    elsif item.quantity == 1
        item.destroy
    else
      item = Item.find_by(itemable_id: current_user.id, coffee_id: @coffee.id)
      # item  = Item.find(u[0].id)
      item.decrement!(:quantity)
      item.reload.quantity
      redirect_to show_all_carts_path
      # item = item.update(quantity: u[0].quantity - 1)
    end 
  end









=================================================================================

<div class="card-body">
        <h5 class="card-title"><%= @coffee.name %></h5>
        <p class="card-text"></p>Amount - 
        <a href="#" class="btn btn-secondary"><%= @coffee.amount %></a>&nbsp &nbsp
        <div class='row d-flex justify-content-center'>                      
          <%= button_to 'Add to cart +', add_user_card_path(@coffee.id), class: 'btn btn-sm btn-success ml-2' %>
        </div><br>
==========
count


        <% if @items.count > 0 %>
        <%= link_to @item do %> 
        <i class="bi bi-cart"></i>
        <%= @coffee.items.quantity %>
        <% end %>

        <% else %>
           <a href="#" class="menu-cart"><i class="bi bi-cart"></i> 0 </a>
        <% end %>  
