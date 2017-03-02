require './logic'
require './player'

class Hangman
    def initialize
        puts "HANGMAN!"
        @player = Player.new
        puts "Welcome, #{@player.name}"
        @game = Logic.new
        play
    end
    
    def play
       print "Enter Letter\n> "
       @guess = gets.chomp.upcase
       if Logic.check(@guess)
           play
        end
    end
end

Hangman.new