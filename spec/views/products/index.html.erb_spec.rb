require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    @products = create_list(:product, 2)
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "MyString".to_s, :count => 2
  end
end
