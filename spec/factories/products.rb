FactoryBot.define do
  factory :product do
    title { "MyString" }

    after(:build) do |product|
      product.service_blocks = build_list(:block, 2, product: product, mark: 'service')
      product.help_blocks    = build_list(:block, 2, product: product, mark: 'help')
    end
  end
end
