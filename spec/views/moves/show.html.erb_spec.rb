require 'spec_helper'

describe "moves/show" do
  before(:each) do
    @move = assign(:move, stub_model(Move,
      :x => 1,
      :y => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
