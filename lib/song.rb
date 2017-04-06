require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.each { |instance| return instance if instance.name == name }
    save
  end

  def self.find_or_create_by_name(name)
    song_names = {}
    @@all.each {|song|
      song_names[song] = song.name
    }

    if song_names.values.include?(name)
      song_names.key(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename (filename)
    filename = filename.gsub(".mp3", "").split(" - ")
    song = Song.new
    song.name = filename[1]
    song.artist_name = filename[0]
    song.save
    return song
  end

  def self.create_from_filename (filename)
    filename = filename.gsub(".mp3", "").split(" - ")
    song = Song.new
    song.name = filename[1]
    song.artist_name = filename[0]
    song.save
    return song
  end

  def self.destroy_all
    @@all.clear
  end

end
