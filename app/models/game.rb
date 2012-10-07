class Game < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many :users
  has_many :moves

  validate :validate_user_count

  def winner
  end

  def result
  end

  def complete?
  end

  def startable?
    return false if started?
    return true if users.size == 2
    false
  end

  def start!
    @state = :started if startable?
  end

  def started?
    @state == :started
  end

  def add_move(move)
    return false unless started?
    return false unless valid_move?(move)
    moves << move
  end

  def valid_move?(move)
    move_within_bounds?(move) && (move.user == current_player)
  end

  def move_within_bounds?(move)
    (0..2).include?(move.x) && (0..2).include?(move.y)
  end

  def current_player
    moves.size.even? ? first_player : second_player
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
