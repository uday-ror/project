class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :itemable_id
      t.string :itemable_type
      t.integer :quantity
      t.integer :coffee_id

      t.timestamps
    end
  end
end
