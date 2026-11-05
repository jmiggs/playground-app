class NoteCreator
  def self.call(title:, body: nil)
    body = body.to_s.strip
    Note.create!(title: title.to_s.strip, body: body.empty? ? nil : body)
  end
end
