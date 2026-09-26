require "rails_helper"

RSpec.describe Calculator do
  describe ".add" do
    it "adds two numbers" do
      expect(Calculator.add(2, 3)).to eq(5)
    end
  end
end
