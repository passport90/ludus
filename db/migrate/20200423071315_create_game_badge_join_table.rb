class CreateGameBadgeJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :games, :badges do |t|
      t.index [:badge_id, :game_id], unique: true
      t.index [:game_id, :badge_id], unique: true
    end
  end
end
