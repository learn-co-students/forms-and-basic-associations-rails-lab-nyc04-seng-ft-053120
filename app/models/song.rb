class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_content=(content)
    content.each do |content|
      found_note = Note.find_or_create_by(content: content)
      self.notes << found_note 
    end

  end

  # def genre_name=(name)
  #   self.genre = Genre.find_or_create_by(name)
  # end

  # def genre_name
  #   self.genre ? self.genre.name : nil
  # end

end
