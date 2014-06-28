class Newtables < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :model_name, null: false
      t.integer :manufacturer_id, null: false
      t.string :color, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
      t.string :description

      t.timestamps
    end

    create_table :manufacturers do |t|
      t.string :name, null: false
      t.string :country, null: false
    end
  end
end
