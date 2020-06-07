class RemoveReviewFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :review, :text
  end
end
