class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :board_state

      t.timestamps
    end
  end
end
