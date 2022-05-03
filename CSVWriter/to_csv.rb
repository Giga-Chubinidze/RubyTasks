require 'csv'
def write_file(hash)
  CSV.open("CSVWriter/data.csv", "a") do |csv|
    csv << hash.values
  end
  puts "data loaded to csv successfully!"
end


hash = {1 => "one",2 => "two",3 => "three",4 => "four"}
write_file(hash)
