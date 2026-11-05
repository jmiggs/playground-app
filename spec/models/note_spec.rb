require "rails_helper"

RSpec.describe Note do
  it "saves a note with a title and reads it back" do
    note = Note.create!(title: "Groceries", body: "eggs, milk")

    expect(Note.find(note.id)).to have_attributes(title: "Groceries", body: "eggs, milk")
  end

  it "is invalid without a title" do
    expect(Note.new(body: "no title")).not_to be_valid
  end

  it "enforces the title at the database level too" do
    expect { Note.new(body: "no title").save!(validate: false) }
      .to raise_error(ActiveRecord::NotNullViolation)
  end
end
