# Logic class contains all rules and gameplay. First sets master word by creating
# new dictionary of words, 4 to 16 chars long from "dictionary.txt" then
# randomly assigns one word to @@master. Creates @@show, and checks player
# input is valid.

# Requires display.rb to show hangman noose ASCII drawings. 
# Requires PStore to save and load saved games
require './lib/display'
require 'pstore'

class Logic
    def initialize
        # Initialize varaibles
        @@master = []
        @@show = []
        @@guessed = []

        # Create Dictionary with words between 5 and 12 chars
        dict = []
        File.open("dictionary.txt").each do |line|
            if line.strip.length.between?(5, 12)
                dict.push(line.strip)
            end
        end

        # Set master to random word in dictionary
        @@master = dict[rand(1..dict.length)].to_s.upcase

        # Set var @@show (dashes string)
        @@master.length.times do
            @@show << "_"
        end
        Logic.show
    end

    # Load saved game
    def self.load_saved_game
        unless File.exist?("./save/game")
            puts "No Saved Games Found"
            puts "Starting New Game"
            return true
        end
        save = PStore.new("./save/game")
        save.transaction do
            @@master = save[:m]
            @@show = save[:s]
            @@guessed = save[:g]
        end
        Logic.show
    end

    # Checks if player guess "save". If not, checks guess is 1 letter. 
    # Returns true (to main.rb) if new guess needed
    def self.check(guess)
        # save game
        if guess == "SAVE"
            save = PStore.new("./save/game")
            save.transaction do
                save[:m] = @@master
                save[:s] = @@show
                save[:g] = @@guessed
            end
            puts "Gave Saved"
            exit
        # check letter is valid
        elsif guess.length != 1 || !(guess =~ /[A-Z]/)
            puts "\nInvalid Letter\n\n"
            return true
        # check letter already guessed
        elsif @@guessed.include?(guess) || @@show.include?(guess)
            puts "\nYou already guessed that letter. Try again\n\n"
            return true
        end
        Logic.match(guess)
    end   

    # MAIN LOOP of program. Compares player guess char to master then updates 
    # @@show. Proceeds to determine win? if no win, calculates number of 
    # remaining guesses. If 0 guesses remain, Game Over.
    def self.match(guess)
        @changed = false
        # check if guess matches any letters in @@master
        for i in (0..@@master.length - 1)
            if guess == @@master[i]
                @@show[i] = @@master[i]
                @changed = true
            end
        end
        # check for win
        if @@show.join("") == @@master
            puts "#{@@show.join(" ")}"
            puts "You win!"
        # no win
        elsif @@guessed.length < 5
            # correct letter guessed
            if @changed
                show
                return true
            # incorrect letter guessed, added to @@guessed
            else
                @@guessed << guess
                show
                return true
            end
        # game over
        else
            system('clear')
            Display.new(6)
            puts "#{@@show.join(" ")}"
            puts "The correct answer was #{@@master}"
            exit
        end
    end

    # display noose, @@show as string, guessed letters, remaining guesses
    def self.show
        Display.new((@@guessed.length))
        puts "\n\n#{@@show.join(" ")} (#{@@master.length} letters)"
        puts "Incorrect: #{@@guessed.join(" ")}"
        puts "Guesses Remaining: #{6 - @@guessed.length}"
    end
end