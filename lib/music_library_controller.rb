class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    user_input = gets.chomp
    while user_input != "exit"
      user_input = gets.chomp
    end

    def output(input)
       case input
       when "list songs"
           self.list_songs
         when "list artists"
           self.list_artists
         when "list genres"
           self.list_genres
         when "play song"
           self.play_song
         when "list artist"
           self.list_artist
         when "list genre"
           self.list_genre
       end
     end

   def list_songs
     Song.all.sort_by!{|song| song.artist.name}.each_with_index do |song, index|
       puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
   end

   def list_artists
     Artist.all.each {|artist| puts "#{artist.name}"}
   end

   def list_genres
     Genre.all.each {|genre| puts "#{genre.name}"}
   end

   def play_song
      puts "song: "
     user_input = gets.chomp
     puts "Playing #{self.playlist.files[input.to_i - 1]}"
   end

   def list_artist
     puts "artist:"
     user_input = gets.chomp
     self.playlist.files.each do |song|
       puts "#{song}" if song.split(" - ")[0] == user_input
     end
   end

   def list_genre
     puts "genre:"
     user_input = gets.chomp
     self.playlist.files.each do |song|
       puts "#{song}" if song.split(" - ")[2].gsub(".mp3", "") == user_input
     end
   end
 end
end
