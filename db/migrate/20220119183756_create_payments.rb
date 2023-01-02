class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :payment_type
      t.integer :card_number
      t.integer :cvc
      t.date :cc_exp_month
      t.references :user_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
