class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes_content=(notes_array)
    
    notes_array.each do |note_ele|
      # gets access to the table?
      
     note = Note.create(content: note_ele,song_id: self.id)

     self.notes << note
    end

  end

end
