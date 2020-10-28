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

  def genre_name
    self.artist ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.map(&:content)
  end

  def note_contents=(contents)
    contents.each do |c|
    #  if c.strip != ""
        # self.notes.build(content: content)
      # end
      unless c.empty?
        self.notes << Note.create(content: c)
        self.save
      end
    end
  end
end
