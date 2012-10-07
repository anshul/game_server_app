describe GameUpdater do

  let(:player1) { FactoryGirl.create(:user) }
  let(:player2) { FactoryGirl.create(:user) }
  let(:started_game) { FactoryGirl.build(:game).tap { |g| g.users << player1 ; g.users << player2 ; g.start! ; g.save}}
  let(:params) {
    {"id" => started_game.id, "game" => {"move" => {"player_id" => player1.id, "x" => 0, "y" => 0}}}
  }


  subject { GameUpdater.new(started_game) }


  describe "process" do
    it "should add a move when valid" do
      expect {subject.update(params)}.to change(Move, :count).by(1)
    end
  end

end
    
