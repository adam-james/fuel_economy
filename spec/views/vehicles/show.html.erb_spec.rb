require 'rails_helper'

RSpec.describe "vehicles/show", type: :view do
  before(:each) do
    @vehicle = assign(:vehicle, Vehicle.create!(
      :make => "Make",
      :model => "Model",
      :year => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/2/)
  end
end
