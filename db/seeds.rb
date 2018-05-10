require 'csv'

HERE = File.dirname(File.expand_path(__FILE__))
FILEPATH = "#{HERE}/vehicles.csv"

CSV.foreach(FILEPATH, headers: true) do |row|
  puts "#{row['year']} #{row['make']} #{row['model']}"
  Vehicle.create! make: row['make'], model: row['model'], year: row['year'],
                  annuel_barrels: row['barrels08'], city_mpg: row['city08'],
                  combined_mpg: row['comb08'], annuel_fuel_cost: row['fuelCost08'],
                  highway_mpg: row['highway08'], you_save_spend: row['youSaveSpend']
end
