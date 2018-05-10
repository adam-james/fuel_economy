class ExpandVehicle < ActiveRecord::Migration[5.2]
  def change
    change_table :vehicles do |t|
      t.float :annuel_barrels
      t.integer :city_mpg
      t.integer :combined_mpg
      t.integer :annuel_fuel_cost
      t.integer :highway_mpg
      t.integer :you_save_spend
    end
  end
end
