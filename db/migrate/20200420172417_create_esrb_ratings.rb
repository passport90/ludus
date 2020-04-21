class CreateEsrbRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :esrb_ratings do |t|
      t.string :name, null: false
      t.string :symbol, null: false

      t.timestamps
    end
    add_index :esrb_ratings, :name
  end
end
