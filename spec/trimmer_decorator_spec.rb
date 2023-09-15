require_relative '../base_decorator'
require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'calls correct_name method on the nameable object and trims the result to the first 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('Lorem ipsum dolor sit amet')
      expect(decorator.correct_name).to eq('Lorem ipsu')
    end
    it 'returns the full name when it is shorter than or equal to 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('John Doe')
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
