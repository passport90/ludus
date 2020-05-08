class AddIsDateConfirmedToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :is_date_confirmed, :bool, null: false, default: false
  end
end
