class AddVideoYouTubeIdToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :video_youtube_id, :string
  end
end
