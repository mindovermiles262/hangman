# Logic class contains all rules and gameplay. First sets master word by creating
# new dictionary of words, 4 to 16 chars long from "dictionary.txt" then
# randomly assigns one word to @@master. Creates @@show, and checks player
# input is valid.

# Requires display.rb to show hangman noose ASCII drawings.
require './display'

class Logic
    def initialize
        # Initialize varaibles
        @@master = []
        @@show = []
        @@guessed = []

        # Create Dictionary with words between 4 and 16 chars
        dict = []
        File.open("dictionary.txt").each do |line|
            if line.strip.length.between?(4, 16)
                dict.push(line.strip)
            end
        end

        # Set master to random word in dictionary
        @@master = dict[rand(1..dict.length)].to_s
        @@master = "FOOBAR" # DEBUG: Clear for real game

        # Set @@show to master.length
        @@master.length.times do
            @@show << "_"
        end
        Logic.show
    end

    # Checks player guess is 1 letter. Returns true if new guess needed
    def self.check(guess)
        # check letter
        if guess.length != 1 || !(guess =~ /[A-Z]/)
            puts "\nInvalid Letter\n\n"
            return true
        elsif @@guessed.include?(guess) || @@show.include?(guess)
            puts "\nYou already guessed that letter. Try again\n\n"
            return true
        # letter passes check
        else
            Logic.match(guess)
        end
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
            exit
        end
    end

    # display noose, @@show as string, guessed letters, remaining guesses
    def self.show
        Display.new((@@guessed.length))
        noshow
    end
    # noshow used for invalid inputs
    def self.noshow
        puts "\n\n#{@@show.join(" ")} (#{@@master.length} letters)"
        puts "Incorrect: #{@@guessed.join(" ")}"
        puts "Guesses Remaining: #{6 - @@guessed.length}"
    end
end