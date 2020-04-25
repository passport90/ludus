class AddReviewToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :review, :text
  end
end
