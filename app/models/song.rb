class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    # sets or find the artist of the passed in name
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name
    # if the song's artist exists, then return the artist's name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    # loops through each note content, try to find the note content, if it doesn't exist create it
    contents.each do |content|
      new_content = Note.find_or_create_by(content: content)
      self.notes << new_content
    end
  end
end
