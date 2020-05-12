class AddIsCompleteToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :is_complete, :bool, null: false, default: false
  end
end
