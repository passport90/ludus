class AddFranchiseIdToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :franchise
    add_foreign_key :games, :franchises
  end
end
