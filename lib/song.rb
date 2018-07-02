require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize(name = nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song
  end

  def self.new_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    Song.new(name)

      # binding.pry
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      # binding.pry
      return Song.create_by_name(name)
    else
      # binding.pry
      return Song.find_by_name(name)
    end
  end

  def self.alphabetical
    arr = []
    @@all.sort_by do |song|
      song.name
      # binding.pry
    end
  end

  def self.new_from_filename(file_name)
    file = file_name.split(' - ')
    name = file[1].split('.')
    song = Song.create_by_name(name[0])
    song.artist_name = file[0]
    song
    # binding.pry
  end

  def self.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    @@all << song
  end

  def self.destroy_all
    @@all = []
  end







end
