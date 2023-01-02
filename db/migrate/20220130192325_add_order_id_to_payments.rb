class AddOrderIdToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :order_id, :integer
    remove_column :payments, :itemable_id, :integer
    remove_column :payments, :user_card_id, :integer
  end
end
