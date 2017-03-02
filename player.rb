# Player class contains all information about player
class Player
    def initialize
        # do something
    end
    def name
       puts "What is your name?"
       @name = gets.chomp.capitalize
    end
end