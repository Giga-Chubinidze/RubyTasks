require 'csv'

def read_file
  CSV.read("CSVLoad/data.csv").to_h
end

puts read_file



