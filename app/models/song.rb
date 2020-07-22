class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #setter method
  #called when song is initialized with a artist_name field
  #will allow us to set artist_name on a song
  #finds artist with passed in
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #this will call the above method when Song is initializec with
  #this artist_name field
  def artist_name
    #if the song's artist exists, return the artist's name
    self.artist ? self.artist.name : nil
  end

  #setter method
  #called when song is initialized with genre_name field
  #will allow us to set genre_name on a song
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name)
  end

  #will call above method when song is initialized 
  #with this genre_name field
  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      a_content = Note.find_or_create_by(content: content)
      self.notes << a_content 
    end
  end


end #end of class
