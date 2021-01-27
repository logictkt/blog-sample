module NoteHelper
  def extract(note)
    strip_tags(note.content.to_s).gsub(/[\n]/,"").strip.gsub(" ", "")
  end
end
