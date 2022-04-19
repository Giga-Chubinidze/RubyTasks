class TicTacToe
  class ConsoleInputError < StandardError; end
  attr_accessor :field

  ARRAY_INDICES = %w[0 1 2].freeze

  def initialize
    @field = [
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
    turn = 0
    loop do
      if draw?
        puts "\nDraw!"
        break
      end

      puts "\nBoard:\n"
      field.each do |i|
        puts i.join(' ')
      end

      if turn.even?
        puts "\nX's turn\n"
      else
        puts "\nO's turn"
      end

      prompt_x =
        prompt_y = 0

      puts 'Enter a unique x coordinates'
      prompt_x = gets.chomp

      puts 'Enter a unique y coordinates'
      prompt_y = gets.chomp

      input_validation(prompt_x, prompt_y)

      prompt_x = prompt_x.to_i
      prompt_y = prompt_y.to_i

      field[prompt_x][prompt_y] =
        if turn.even?
          'X'
        else
          'O'
        end

      puts "\nBoard:\n"
      field.each do |i|
        puts i.join(' ')
      end

      turn += 1
      if check_win(field) == true
        puts turn.even? ? 'Winner: O' : 'Winner: X'
        break
      end
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
      true
    else
      false
    end
  end
end

game = TicTacToe.new
game.play




