FactoryBot.define do
  factory :product do
    name "MyString"
    pricing "9.99"
    description "MyText"
    association :user, factory: :user 
    state false
  end
end
