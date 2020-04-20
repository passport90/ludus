class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.ltree :path, null: false

      t.timestamps
    end

    add_index :genres, :path, using: :gist
  end
end
