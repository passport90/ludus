class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :symbol, null: false
      t.date :award_date, null: false

      t.timestamps
    end

    add_index :badges, [:award_date, :name]
  end
end
