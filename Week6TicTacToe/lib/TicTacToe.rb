class TicTacToe
  class ConsoleInputError < StandardError; end
  attr_accessor :field

  ARRAY_INDICES = %w[0 1 2].freeze

  def initialize(field = nil)
    @field = field 
    @field ||= 
    [
      [254.chr, 254.chr, 254.chr],
      [254.chr, 254.chr, 254.chr],
      [254.chr, 254.chr, 254.chr]
    ]
    
  end

  def play
    console_line_interface
  rescue ConsoleInputError => e
    warn e.message
  end

  def console_line_interface
    prompt_x = prompt_y = turn = 0
    print_board

    loop do
      break if find_winner || draw?

      puts turn.even? ? "\nX's turn\n" : "\nO's turn"

      coordinate_array = input_coordinates(prompt_x, prompt_y)

      prompt_x = coordinate_array[0].to_i
      prompt_y = coordinate_array[1].to_i

      field[prompt_x][prompt_y] = turn.even? ? 'X': 'O'

      print_board

      turn += 1
    end
  end

  def input_coordinates(prompt_x, prompt_y)
    puts 'Enter a unique x coordinates'
    prompt_x = gets.chomp

    puts 'Enter a unique y coordinates'
    prompt_y = gets.chomp

    input_validation(prompt_x, prompt_y)
    [prompt_x, prompt_y]
  end

  def print_board
    puts "\nBoard:\n"
    field.each do |i|
      puts i.join(' ')
    end
  end

  def find_winner
    if check_win(field)
      puts 'Game Over! We Have a Winner!'
      true 
    end
  end  

  def check_win(game_field)
    game_field_vertical = game_field.transpose

    check_all_elems(game_field[0][0..2]) ||
    check_all_elems(game_field[1][0..2]) ||
    check_all_elems(game_field[2][0..2]) ||

    check_all_elems(game_field_vertical[0][0..2]) ||
    check_all_elems(game_field_vertical[1][0..2]) ||
    check_all_elems(game_field_vertical[2][0..2]) ||

    check_all_elems(get_left_diagonal(game_field)) ||
    check_all_elems(get_right_diagonal(game_field)) 
  end

  def get_left_diagonal(array)
    res = []
    (0...array.length).each do |i|
      res << array[i][i]
    end
    res
  end

  def get_right_diagonal(array)
    res = []
    (0...array.length).each do |i|
      res << array[i][array.length - 1 - i]
    end
    res
  end

  def check_all_elems(array)
    array.flatten.all? { |i| i == 'X' } || array.flatten.all? { |i| i == 'O' }
  end

  def input_validation(prompt_x, prompt_y)
    unless (ARRAY_INDICES.include?(prompt_x) && ARRAY_INDICES.include?(prompt_y)) && 
           !place_taken?(prompt_x.to_i, prompt_y.to_i)
      raise ConsoleInputError,'Invalid Input'
    end
  end

  def place_taken?(x_coord, y_coord)
    field[x_coord][y_coord] == 'X' ||
    field[x_coord][y_coord] == 'O'
  end

  def draw?
    if (check_win(field) == false) && field.flatten.none? { |i| i == 254.chr }
      puts "\nDraw!"
      true
    else
      false
    end
  end
end



game = TicTacToe.new()
game.play
