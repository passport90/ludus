class RemoveVideoLinkFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :video_link, :string
  end
end
