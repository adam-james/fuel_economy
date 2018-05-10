require 'csv'

# Reads vehicles from file.
class VehicleReader
  HERE = File.dirname(File.expand_path(__FILE__))
  FILEPATH = "#{HERE}/vehicles.csv"

  VehicleRow = Struct.new(:make, :model, :year)

  def initialize
    @row_index = 0
  end

  def foreach
    CSV.foreach(FILEPATH) do |row|
      unless @row_index == 0
        yield VehicleRow.new(@headers.make(row),
                             @headers.model(row),
                             @headers.year(row))
      else
        @headers = VehicleHeaders.new(row)
      end
      @row_index += 1
    end
  end

  # Keeps indexes of header names.
  class VehicleHeaders
    def initialize(row)
      @make_index = row.find_index('make')
      @model_index = row.find_index('model')
      @year_index = row.find_index('year')
    end

    def make(row)
      row[@make_index]
    end

    def model(row)
      row[@model_index]
    end

    def year(row)
      row[@year_index].to_i
    end
  end
end

vehicle_reader = VehicleReader.new
count = 1
vehicle_reader.foreach do |row|
  break if count > 500
  puts "#{row.year} #{row.make} #{row.model}"

  Vehicle.create! make: row.make, model: row.model, year: row.year
  count += 1
end
