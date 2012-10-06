require 'spec_helper'

describe Game do

  
  describe "#board" do
    subject { FactoryGirl.build(:game).board}
    it { should be_a Board }
    it { should be_empty}
  end
  context "with zero players" do
    subject { FactoryGirl.build(:game) }
    it { should_not be_valid }
  end

  context "with one player" do
    subject { FactoryGirl.build(:game).tap { |g| 1.times { g.users <<  FactoryGirl.create(:user) } } }
    it { should be_valid }
    its(:first_player) { should be_a User }
    its(:second_player) { should be_nil}
  end

  context "with two players" do
    let!(:player1) { FactoryGirl.create(:user) }
    let!(:player2) { FactoryGirl.create(:user) }
    subject { FactoryGirl.build(:game).tap { |g| g.users << player1 ; g.users << player2  }}
    it { should be_valid }
    its(:first_player) { should be player1 }
    its(:second_player) { should be player2 }
  end

  context "with three players" do
    subject { FactoryGirl.build(:game).tap { |g| 3.times { g.users <<  FactoryGirl.create(:user) } } }
    it { should_not be_valid }
  end


end
