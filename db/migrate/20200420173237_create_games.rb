class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.references :platform, null: false, foreign_key: true
      t.date :release_date, null: false
      t.references :publisher, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.references :esrb_rating, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end

    add_index :games, [:release_date, :title]
  end
end
