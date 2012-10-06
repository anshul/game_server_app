class Game < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many :users

  validate :validate_user_count

  def validate_user_count
    errors.add(:users, "Too many users.") if users.count > 2
    errors.add(:users, "Too few users.") if users.count < 1
  end

end
