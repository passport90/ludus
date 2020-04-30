class ReplaceReleaseDateTitleIndexOnGames < ActiveRecord::Migration[6.0]
  def change
    remove_index :games, name: 'index_games_on_release_date_and_title'
    add_index :games, :release_date
  end
end
