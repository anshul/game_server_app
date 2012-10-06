require 'spec_helper'

describe Game do

  before :each do
    @game = FactoryGirl.create(:game)
    @game.users << FactoryGirl.create(:user)
  end

  it "should be valid with 1 user" do
    @game.should be_valid
  end

  it "should be valid with 2 users" do
    @game.users << FactoryGirl.create(:user)
    @game.should be_valid
  end

  it "should not be valid with 3 users" do
    @game.users << FactoryGirl.create(:user)
    @game.users << FactoryGirl.create(:user)
    @game.should_not be_valid 
  end


end
