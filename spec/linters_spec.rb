require_relative '../lib/rules'

RSpec.describe Rules do
  describe '#first_line' do
    it 'returns an array of error messages' do
      first_line = 'json file test'
      expect(Rules.new(first_line, 0).check_for_errors).to include(["'{' expected at the beginning of the line", 1])
      # p Rules.new(first_line, 0).check_for_errors
    end

    it 'doen\'t return an array any error in case of the first line contains only \'{\'' do
      first_line = '{'
      expect(Rules.new(first_line, 0).check_for_errors).not_to include(["'{' expected at the beginning of the line", 1])
      # p Rules.new(first_line, 0).check_for_errors
    end
  end

  describe '#after_curly' do
    it 'checks if there is a new line after \'{\'' do
      first_line = '{'
      expect(Rules.new(first_line, 0).check_for_errors).to include(["New line expected after '{'", 1])
    end
  end
end
