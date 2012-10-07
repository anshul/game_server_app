require 'spec_helper'

def create_moves(coords)
  Move.destroy_all
  coords.each do |x,y|
    FactoryGirl.create(:move, :x => x, :y => y)
  end
  Move
end
describe Move do
  it { should belong_to :game }
  it { should belong_to :user }
  it { should allow_mass_assignment_of :x } 
  it { should allow_mass_assignment_of :y } 
  it { should_not allow_mass_assignment_of :user_id } 
  it { should_not allow_mass_assignment_of :game_id } 

  it { should validate_presence_of :x }
  it { should validate_presence_of :y }

  describe "winning moves" do
    let(:all_xs) { create_moves([[1,0],[1,1],[1,2]]) }
    let(:all_ys) { create_moves([[0,0],[1,0],[2,0]]) }
    let(:x_eq_y) { create_moves([[0,0],[1,1],[2,2]]) }
    let(:sum_is_2) { create_moves([[0,2],[1,1],[2,0]]) }
    let(:two_moves) { create_moves([[0,2],[1,1]]) }
    let(:four_moves) { create_moves([[0,0],[0,2],[1,1],[2,0]]) }
    
    specify { all_xs.should be_winning_moves }
    specify { all_ys.should be_winning_moves }
    specify { x_eq_y.should be_winning_moves }
    specify { sum_is_2.should be_winning_moves }
    specify { two_moves.should_not be_winning_moves }
    specify { four_moves.should be_winning_moves }
  end
end
