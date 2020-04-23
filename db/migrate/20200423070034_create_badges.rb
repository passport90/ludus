class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :index
      t.string :show
      t.string :new
      t.string :create

      t.timestamps
    end
  end
end
