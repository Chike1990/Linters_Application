require_relative '../lib/rules.rb'

describe linters do
  describe Rules do
    let(:rules) {Rules.new}
    describe '#first_line' do
        it 'returns a message to an array of error messages' do
    
      expect(error_scanner.first_line).to eql()
    end
  end
end
end



