require 'rails_helper'

RSpec.describe "vehicles/edit", type: :view do
  before(:each) do
    @vehicle = assign(:vehicle, Vehicle.create!(
      :make => "MyString",
      :model => "MyString",
      :year => 1
    ))
  end

  it "renders the edit vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicle_path(@vehicle), "post" do

      assert_select "input[name=?]", "vehicle[make]"

      assert_select "input[name=?]", "vehicle[model]"

      assert_select "input[name=?]", "vehicle[year]"
    end
  end
end
