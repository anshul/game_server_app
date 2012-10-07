require 'spec_helper'

describe "moves/edit" do
  before(:each) do
    @move = assign(:move, stub_model(Move,
      :x => 1,
      :y => 1
    ))
  end

  it "renders the edit move form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => moves_path(@move), :method => "post" do
      assert_select "input#move_x", :name => "move[x]"
      assert_select "input#move_y", :name => "move[y]"
    end
  end
end
