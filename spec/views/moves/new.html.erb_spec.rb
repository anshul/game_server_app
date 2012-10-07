require 'spec_helper'

describe "moves/new" do
  before(:each) do
    assign(:move, stub_model(Move,
      :x => 1,
      :y => 1
    ).as_new_record)
  end

  it "renders new move form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => moves_path, :method => "post" do
      assert_select "input#move_x", :name => "move[x]"
      assert_select "input#move_y", :name => "move[y]"
    end
  end
end
