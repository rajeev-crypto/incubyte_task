# calculator code 
class Calculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiter = ","
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers.split("\n", 2)[1]
    end

    numbers.split(/[\n#{delimiter}]/).map(&:strip).each do |value_str|
    raise "Invalid input" if value_str.empty?
    end

    numbers = numbers.split(/[\n#{delimiter}]/).map(&:to_i)

    negatives = numbers.select { |num| num < 0 }
    if negatives.any?
      raise "negatives not allowed: #{negatives.join(', ')}"
    else
      numbers.inject(0) { |sum, num| sum + num }
    end
  end
end