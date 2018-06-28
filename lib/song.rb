require 'pry'

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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    new_string = filename.chomp(".mp3")
    new_array = new_string.split(" - ")
    song = self.new_by_name(new_array[1])
    song.artist_name = new_array[0]
    song
  end

  def self.create_from_filename(filename)
    new_string = filename.chomp(".mp3")
    new_array = new_string.split(" - ")
    song = self.create_by_name(new_array[1])
    song.artist_name = new_array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
