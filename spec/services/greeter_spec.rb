require "rails_helper"

RSpec.describe Greeter do
  describe ".greet" do
    it "greets by name" do
      expect(Greeter.greet("world")).to eq("hello world")
    end
  end
end
