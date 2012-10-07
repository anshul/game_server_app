class Move < ActiveRecord::Base
  attr_accessible :x, :y
  belongs_to :game
  belongs_to :user
  validates :x, :presence => true
  validates :y, :presence => true
end
