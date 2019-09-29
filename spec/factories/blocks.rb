FactoryBot.define do
  factory :block do
    title { "MyString" }
    content { "MyText" }
    position { 1 }
    product
  end
end
