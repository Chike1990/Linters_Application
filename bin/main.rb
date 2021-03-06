require './lib/rules'
require 'colorize'

Dir.glob('**/*.json').each do |file_name|
  file = File.read(file_name)
  array = file.each_line.to_a

  puts "Checking #{file_name}".yellow
  errors_counter = 0
  array.each_with_index do |l, i|
    line = i.zero? ? Rules.new(l, i) : Rules.new(l, i, array[i - 1])
    line_errors = line.check_for_errors
    line_errors.each do |errors|
      puts "Line #{errors[1]} : ".red + errors[0]
    end
    errors_counter += line_errors.length
  end

  puts "No errors found for #{file_name}".green if errors_counter.zero?
end
