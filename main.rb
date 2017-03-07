require './logic'
require './player'

class Hangman
    def initialize
        puts "HANGMAN!"
        @player = Player.new
        puts "Welcome, #{@player.name}"
        puts "Resume from last save? (Y/N)"
        @save_game = gets.chomp.upcase
        if @save_game == "Y" || @save_game == "YES"
            puts "Loading Saved Game . . ."
            @game = Logic.load_saved_game
            if @game then Logic.new end
        else
            puts "Starting New Game . . ."
            @game = Logic.new
        end
        play
    end
    
    def play
       print "Enter Letter (or SAVE)\n> "
       @guess = gets.chomp.upcase
       if Logic.check(@guess)
           play
        end
    end
end

Hangman.new