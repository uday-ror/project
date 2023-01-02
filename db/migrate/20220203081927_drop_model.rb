class DropModel < ActiveRecord::Migration[6.0]
  def change
    drop_table :carts
    drop_table :cart_items
    drop_table :user_cards
    drop_table :order_items
    drop_table :dummies
    drop_table :reviews        
  end
end
