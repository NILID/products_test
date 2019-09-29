FactoryBot.define do
  factory :block do
    title { "MyString" }
    content { "MyText" }
    position { 1 }
    mark { 'service' }
    product
  end
end
