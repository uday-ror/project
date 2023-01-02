class AddDetailToCoffees < ActiveRecord::Migration[6.0]
  def change
    add_column :coffees, :detail, :string
  end
end
