class CreatePlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :platforms do |t|
      t.string :name, null: false
      t.date :release_date, null: false
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end

    add_index :platforms, :release_date
  end
end
