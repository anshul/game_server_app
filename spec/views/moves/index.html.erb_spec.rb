require 'spec_helper'

describe "moves/index" do
  before(:each) do
    assign(:moves, [
      stub_model(Move,
        :x => 1,
        :y => 2
      ),
      stub_model(Move,
        :x => 1,
        :y => 2
      )
    ])
  end

  it "renders a list of moves" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
