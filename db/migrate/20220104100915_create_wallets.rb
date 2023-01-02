class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer :pauyment_id
      t.float :available_amount
      t.integer :order_id

      t.timestamps
    end
  end
end
