
require "pry"
class Song
  attr_accessor :artist_name, :name
  @@all = []

        def initialize
          @name = name
        end

        def self.create
          @self = Song.new
          @@all << @self
          @self
        end

        def self.new_by_name(title)
          new_song = self.new
          new_song.name = title
          new_song
        end

        def self.create_by_name(name)
          new_song = self.new_by_name(name)
          new_song.save
          new_song
        end

        def self.find_by_name(song_name)
          self.all.detect {|song| song.name == song_name}
        end

        def self.find_or_create_by_name(new_song)
            if self.find_by_name(new_song) == new_song
              new_song
              else
              self.create_by_name(new_song)
            end

        end

        def self.alphabetical
          self.all.sort_by {|song| song.name}
        end

        def self.new_from_filename(filename)
            filename = filename.split(" - ")
            artist = filename[0]
            song_name = filename[1]
            song_name.slice! ".mp3"
            new_song = self.new_by_name (song_name)
            new_song.artist_name = artist
            new_song

        end

        def self.all
          @@all
        end

        def save
          self.class.all << self
        end

        def self.create_from_filename(file_name)
          new_song = self.new_from_filename(file_name)
          new_song.save
          new_song
        end

        def self.destroy_all
          @@all.clear
        end
end
