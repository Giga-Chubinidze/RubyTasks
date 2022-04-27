require 'CaesarCipher'

describe CaesarCipher do
  context 'valid input' do
    it 'works with What a string! and 5' do
      expect(CaesarCipher.new('What a string!', 5).call).to eq 'Bmfy f xywnsl!'
    end

    it 'works with Hello World! and 7' do
      expect(CaesarCipher.new('Hello World!', 7).call).to eq 'Olssv Dvysk!'
    end

    it 'works with Hey, my name is Zach. and 1' do
      expect(CaesarCipher.new('Hey, my name is Zach.', 1).call).to eq 'Ifz, nz obnf jt Abdi.'
    end

    it 'works with Hey and -8' do
      expect(CaesarCipher.new('Hey', -8).call).to eq 'Zwq'
    end
  end

  context 'invalid input' do
    it 'fails with number' do
      expect(CaesarCipher.new(2, 35).call).to eq nil
    end

    it 'fails with boolean' do
      expect(CaesarCipher.new(true, 5).call).to eq nil
    end
  end
end
