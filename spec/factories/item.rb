FactoryBot.define do
  factory :item do
    # itemable_id { 1 }
    # itemable_type { 'user' }
    itemable { FactoryBot.create(:user) }
    quantity { 1 }
  end

  factory :item1 do
    itemable_id { 1 }
    itemable_type { 'user' }
    coffee_id { 2 }
    quantity { 2 }
  end


  factory :item2 do
    itemable_id { 1 }
    itemable_type { 'user' }
    coffee_id { 3 }
    quantity { 3 }
  end

  factory :item3 do
    itemable_id { 1 }
    itemable_type { 'user' }
    coffee_id { 4 }
    quantity { 4 }
  end


  factory :item4 do
    itemable_id { 1 }
    itemable_type { 'user' }
    coffee_id { 5 }
    quantity { 5 }
  end
end
