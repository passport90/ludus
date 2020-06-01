class CreateFranchises < ActiveRecord::Migration[6.0]
  def change
    create_table :franchises do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :franchises, :name, unique: true
  end
end
