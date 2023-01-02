class AddAddressToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :address, :string
    add_column :orders, :permanent_address, :string
    add_column :orders, :mobile_no, :integer
    add_column :orders, :pincode, :integer
  end
end
