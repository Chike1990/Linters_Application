require_relative ''
source_file = ''

describe ErrorScanner do
  error_scanner = ErrorScanner.new(source_file)

  describe 'first_line' do
    it 'returns ["{" expected at the beginning of the line, @line_number] ' do
      actual = '[File: ./samples/javascript_test_01.js], [Line: #1], [Style Error: Prefer CamelCase over snake_case].'
      expect(error_scanner.checker_function_name).to eql(actual)
    end
  end

  describe 'after_curly' do
    it 'returns [New line expected after "{", @line_number]' do
      actual = '[File: ./samples/javascript_test_01.js], [Line: #1], [Error: Missing parentheses].'
      expect(error_scanner.checker_parentheses_function).to eql(actual)
    end
  end

  describe 'after_colon' do
    it 'returns [Add space after ":", @line_number] ' do
      actual = '[File: ./samples/javascript_test_01.js], [Line: #1], [Error: Missing opening curly brace].'
      expect(error_scanner.checker_open_curlybrace_function).to eql(actual)
    end
  end

  describe 'after_comma' do
    it 'returns [New line expected after ', ', @line_number] ' do
      actual = '[File: ./samples/javascript_test_01.js], [Line: #1], [Error: Missing closing curly brace].'
      expect(error_scanner.checker_close_curlybrace_function).to eql(actual)
    end
  end

  describe 'after_square_bracket' do
    it '[New line expected after "[" and empty line is expected after "]," @line_number]' do
      actual = '[File: ./samples/javascript_test_01.js], [Line: #1], [Error: Missing closing curly brace].'
      expect(error_scanner.checker_close_curlybrace_function).to eql(actual)
    end
  end

  describe 'before_curly' do
    it '[New empty line expected before "}",@line_number]' do
      actual = '[File: ./samples/javascript_test_01.js], [Line: #1], [Error: Missing closing curly brace].'
      expect(error_scanner.checker_close_curlybrace_function).to eql(actual)
    end
  end

  describe 'indentation' do
    it '[New empty line expected before "}",@line_number]' do
      actual = '[File: ./samples/javascript_test_01.js], [Line: #1], [Error: Missing closing curly brace].'
      expect(error_scanner.checker_close_curlybrace_function).to eql(actual)
    end
  end
end
