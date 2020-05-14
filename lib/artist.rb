class Artist

  attr_accessor :name, :songs
  
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap do |artist|
      artist.save
    end
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    @songs.collect{|song| song.artist}.uniq
  end

end