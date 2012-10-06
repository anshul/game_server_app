class Game < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many :users

  validate :validate_user_count

  def board
    Board.new
  end

  def first_player 
    users[0]
  end

  def second_player
    users[1]
  end

  def validate_user_count
    errors.add(:users, "Too many users.") if users.size > 2
    errors.add(:users, "Too few users.") if users.empty?
  end

end
