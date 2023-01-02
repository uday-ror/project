FactoryBot.define do
  factory :order do
    address { "MyString" }
    permanent_address { "MyString" }
    mobile_no { 8988828398 }
    total { 0 }
    pincode { 452020 }
    user_id { 1 }
  end

  factory :order1 do
    address { "MyString" }
    permanent_address { "MyString" }
    mobile_no { 8988828398 }
    total { 0 }
    pincode { 452016 }
    user_id { 1 }
  end


  factory :order2 do
    address { "MyString" }
    permanent_address { "MyString" }
    mobile_no { 8988828398 }
    total { 0 }
    pincode { 452001 }
    user_id { 1 }
  end
end
