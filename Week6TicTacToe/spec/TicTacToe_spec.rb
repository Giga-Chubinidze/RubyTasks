require_relative '../lib/TicTacToe'

RSpec.describe TicTacToe do
  let(:empty_board) do
      [
        [254.chr, 254.chr, 254.chr],
        [254.chr, 254.chr, 254.chr],
        [254.chr, 254.chr, 254.chr]
      ]
  end
  
  
  let(:win_fst) do
      [
        ['X', 'O', 254.chr],
        [254.chr, 'X', 'O'],
        ['O', 254.chr, 'X']
      ]
  end

  let(:win_snd) do 
    [
      ['X', 254.chr, 254.chr],
      [254.chr, 'X', 254.chr],
      [254.chr, 254.chr, 'X']
    ]
  end

  let(:tie_fst) do
      [
        ['X', 'X', 'O'],
        ['O', 'X', 'X'],
        ['X', 'O', 'O']
      ]
  end

  let(:tie_snd) do
    [
      ['X', 'O', 'X'],
      ['O', 'X', 'X'],
      ['O', 'x', 'O']
    ]
  end


  context 'when a new game is created' do
    describe '#initialize' do
      it 'should create a new empty board' do
        expect(TicTacToe.new.field).to eql(empty_board)
      end
    end
  end

  context 'when the game is won' do
    it 'should should be equal to another winning mode' do
      expect(TicTacToe.new(win_fst).play).to match(TicTacToe.new(win_snd).play)
    end
  end

  context 'when the game is tied' do
    it 'should return tie' do
      expect(TicTacToe.new(tie_fst).play).to match(TicTacToe.new(tie_fst).play)
    end
  end
end