require_relative '../base_decorator'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('nameable') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }
  describe '#correct_name' do
    it 'calls correct_name method on the nameable object and capitalizes the result' do
      allow(nameable).to receive(:correct_name).and_return('john doe')
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
