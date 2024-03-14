#spec file
require_relative 'calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe ".add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number for a single number string" do
      expect(calculator.add("1")).to eq(1)
    end

    it "returns the sum for two numbers separated by comma" do
      expect(calculator.add("1,5")).to eq(6)
    end

    it "returns the sum for multiple numbers separated by comma" do
      expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it "allows new lines between numbers" do
      expect(calculator.add("1\n2,3")).to eq(6)
    end
    it "allows new lines between numbers  input is invalid" do
      expect { calculator.add("1, \n") }.to raise_error(RuntimeError, "Invalid input")
    end

    it "allows custom delimiters" do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an error for negative numbers" do
      expect { calculator.add("1,-2,3") }.to raise_error(RuntimeError, "negatives not allowed: -2")
    end
  end
end
