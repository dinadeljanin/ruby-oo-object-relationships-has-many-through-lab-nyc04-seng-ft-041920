class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def songs # try to remember what it means to have many here
    Song.all.select { |songs| songs.genre == self }
  end

  def artists
    # returns an array
    self.songs.collect { |songs| songs.artist }
  end
end
