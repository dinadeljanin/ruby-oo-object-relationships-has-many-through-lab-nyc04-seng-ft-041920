class Artist
  attr_reader :name

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

  def songs
    # want to basically return an array full of songs by this artist
    Song.all.select { |songs| songs.artist == self }
  end

  def new_song(name, genre)
    Song.new(name, self, genre)
  end

  def genres
    # i feel like we have to collect this into an array, da?
    # also call on songs here!
    self.songs.collect { |song| song.genre }
  end
end
