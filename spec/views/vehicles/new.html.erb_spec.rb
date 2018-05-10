require 'rails_helper'

RSpec.describe "vehicles/new", type: :view do
  before(:each) do
    assign(:vehicle, Vehicle.new(
      :make => "MyString",
      :model => "MyString",
      :year => 1
    ))
  end

  it "renders new vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicles_path, "post" do

      assert_select "input[name=?]", "vehicle[make]"

      assert_select "input[name=?]", "vehicle[model]"

      assert_select "input[name=?]", "vehicle[year]"
    end
  end
end
