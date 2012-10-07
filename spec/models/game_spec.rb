require 'spec_helper'

describe Game do

  let!(:player1) { FactoryGirl.create(:user) }
  let!(:player2) { FactoryGirl.create(:user) }
  it { should have_many :moves }
  it { should have_and_belong_to_many :users}
  
  context "with zero players" do
    subject { FactoryGirl.build(:game) }
    it { should_not be_valid }
  end

  context "with one player" do
    subject { FactoryGirl.build(:game).tap { |g| g.users <<  player1  } }
    it { should be_valid }
    its(:first_player) { should be_a User }
    its(:second_player) { should be_nil}
    it { should_not be_startable }
    context "when trying to start" do
      before(:each) { subject.start! }
      it { should_not be_started }
      it { should_not be_startable }
      context "when trying to make a move" do
        context "with first move" do
          let!(:first_move) { FactoryGirl.create(:move, :user => player1, :x=> 0, :y => 0)  }
          specify { subject.add_move(first_move).should be_false }
          it { should  be_valid  }
          its("moves.size") { should be 0 } 
          its(:current_player) { should be player1} 
        end
      end
    end
  end

  context "with two players" do
    subject { FactoryGirl.build(:game).tap { |g| g.users << player1 ; g.users << player2  }}
    it { should be_valid }
    its(:first_player) { should be player1 }
    its(:second_player) { should be player2 }
    it { should be_startable }

    context "when it has started" do
      subject { FactoryGirl.build(:game).tap { |g| g.users << player1 ; g.users << player2 ; g.start! }}
      it { should be_valid }
      it { should be_started }
      it { should_not be_startable }
      its(:current_player) { should be player1 }
      context "when moves are made" do

        context "with first valid move" do
          let!(:first_move) { FactoryGirl.create(:move, :user => player1, :x=> 0, :y => 0)  }
          specify { subject.add_move(first_move).should be_true }
          before(:each) { subject.add_move(first_move) }
          it { should  be_valid  }
          its("moves.size") { should be 1 } 
          its(:current_player) { should be player2 } 
          it { should_not be_complete }
          its(:winner) { should  be_nil }
          its(:result) { should be_nil }
        end

        context "with first invalid move" do
          let!(:first_move) { FactoryGirl.create(:move, :user => player1, :x=> 6, :y => 6)  }
          specify { subject.add_move(first_move).should be_false }
          before(:each) { subject.add_move(first_move) }
          it { should  be_valid  }
          its("moves.size") { should be 0 } 
          its(:current_player) { should be player1 } 
        end
      end
    end

  end

  context "with three players" do
    subject { FactoryGirl.build(:game).tap { |g| 3.times { g.users <<  FactoryGirl.create(:user) } } }
    it { should_not be_valid }
  end

  context "when dealing with moves" do
    context "with reference to bounds" do
      let!(:move) { FactoryGirl.build(:move, :x => 0, :y => 0) }
      let!(:good_move) { FactoryGirl.build(:move, :x => 2, :y => 2) }
      let!(:bad_move) { FactoryGirl.build(:move, :x => 3, :y => 3) }
      let!(:another_bad_move) { FactoryGirl.build(:move, :x => -1, :y => -1) }
      specify { subject.move_within_bounds?(move).should be_true }
      specify { subject.move_within_bounds?(good_move).should be_true }
      specify { subject.move_within_bounds?(bad_move).should be_false}
      specify { subject.move_within_bounds?(another_bad_move).should be_false}
    end
  end

end
