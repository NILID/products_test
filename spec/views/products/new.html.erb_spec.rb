require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    @product = build(:product)
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[title]"
    end
  end
end
