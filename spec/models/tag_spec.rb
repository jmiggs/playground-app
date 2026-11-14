require "rails_helper"

RSpec.describe Tag do
  it "is valid with a name" do
    expect(Tag.new(name: "urgent")).to be_valid
  end

  it "is invalid without a name" do
    expect(Tag.new).not_to be_valid
  end

  it "is invalid with a duplicate name" do
    Tag.create!(name: "urgent")

    expect(Tag.new(name: "urgent")).not_to be_valid
  end
end
