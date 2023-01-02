FactoryBot.define do
  factory :coffee do
    name { "black" }
    amount { 1000 }
  end

  factory :coffee2 do
    name { "tea" }
    amount { 2000 }
  end

  factory :coffee3 do
    name { "CAPPUCCINO" }
    amount { 1000 }
  end

  factory :coffee4 do
    name { "COLD BREW COFFEE" }
    amount { 2000 }
  end

  factory :coffee5 do
    name { "AFFOGATO" }
    amount { 1000 }
  end
end