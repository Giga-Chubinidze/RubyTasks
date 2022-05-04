require 'csv'

class FileWriter
  attr_accessor :path

  def initialize
    @path = 'CSVWriter/data.csv'
  end

  def save_to_csv(word_list)
    CSV.open(path, 'a') do |csv|
      csv << word_list
    end
    puts 'Successfully added to CSV'
  end

  def read_from_csv
    CSV.read(path).to_a
  end
end
