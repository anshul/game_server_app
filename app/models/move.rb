class Move < ActiveRecord::Base
  attr_accessible :x, :y
  belongs_to :game
  belongs_to :user
  validates :x, :presence => true
  validates :y, :presence => true
  
  def self.winning_moves?
    all_xs    = all.select{|move| move.x == all.first.x}.count
    all_ys    = all.select{|move| move.y == all.first.y}.count
    top_left  = all.select{|move| move.y == move.x}.count
    top_right = all.select{|move| move.x + move.y == 2}.count

    [all_xs, all_ys, top_left, top_right].include?(3)
    
  end

end
