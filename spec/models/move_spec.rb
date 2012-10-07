require 'spec_helper'

describe Move do
  it { should belong_to :game }
  it { should belong_to :user }
  it { should allow_mass_assignment_of :x } 
  it { should allow_mass_assignment_of :y } 
  it { should_not allow_mass_assignment_of :user_id } 
  it { should_not allow_mass_assignment_of :game_id } 

  it { should validate_presence_of :x }
  it { should validate_presence_of :y }
end
