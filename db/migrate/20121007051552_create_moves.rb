class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :x
      t.integer :y
      t.references :user
      t.references :game

      t.timestamps
    end
  end
end
