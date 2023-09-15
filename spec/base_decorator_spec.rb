require_relative '../nameable'
require_relative '../base_decorator'

describe BaseDecorator do
  let(:nameable) { double('nameable') }
  let(:decorator) { BaseDecorator.new(nameable) }
  describe '#correct_name' do
    it 'calls correct_name method on the nameable object' do
      expect(nameable).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
