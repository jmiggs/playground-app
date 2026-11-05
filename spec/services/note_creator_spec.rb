require "rails_helper"

RSpec.describe NoteCreator do
  it "persists the note" do
    note = nil
    expect { note = described_class.call(title: "Hello", body: "World") }
      .to change(Note, :count).by(1)

    found = Note.find(note.id)
    expect(found.title).to eq("Hello")
    expect(found.body).to eq("World")
  end

  it "strips whitespace from title and body" do
    note = described_class.call(title: "  Hello \n", body: "\t World  ")

    found = Note.find(note.id)
    expect(found.title).to eq("Hello")
    expect(found.body).to eq("World")
  end

  it "raises RecordInvalid for a blank title without creating a record" do
    expect { described_class.call(title: "") }
      .to raise_error(ActiveRecord::RecordInvalid)
    expect { described_class.call(title: "   ") }
      .to raise_error(ActiveRecord::RecordInvalid)
    expect(Note.count).to eq(0)
  end

  it "stores a whitespace-only body as nil" do
    note = described_class.call(title: "Hello", body: "   ")

    expect(Note.find(note.id).body).to be_nil
  end

  it "defaults body to nil" do
    note = described_class.call(title: "Hello")

    expect(Note.find(note.id).body).to be_nil
  end
end
