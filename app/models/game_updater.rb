class GameUpdater

  def initialize(params)
    @game = Game.find(params[:id])
    @params = params
  end

  def update
    users = @params[:game].delete(:users)
    @game.users = users.map{ |u| User.find(u) } if users
    if @params["game"]["move"]
      @params["game"]["move"]["user"] = User.find(@params["game"]["move"].delete("player_id"))
      @game.add_move(Move.new(@params["move"])) 
    end
  end

end
