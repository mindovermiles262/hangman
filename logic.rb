# Logic class contains all rules and gameplay
require './display'
class Logic

    def initialize
        # Initialize varaibles
        @@master = []
        @@show = []
        @@guessed = []
        @@remaining = 6

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

        # Set show array to master length
        @@master.length.times do
            @@show << "_" # use @show.join(" ") to display
        end
        Logic.show
    end

    # return true if new guess needed
    def self.check(guess)
        # check letter
        if guess.length != 1 && !!(guess =~ /[A-Z]/)
            puts "\nInvalid Letter\n\n"
            show
            return true
        elsif @@guessed.include?(guess)
            puts "\nYou already guessed that letter. Try again\n\n"
            show
            return true
        else
            Logic.match(guess)
        end
    end   

    def self.match(guess)
        @changed = false
        for i in (0..@@master.length - 1)
            if guess == @@master[i]
                @@show[i] = @@master[i]
                @changed = true
            end
        end
        if @@show == @@master
            puts "You win!"
        elsif @@remaining > 1
            if @changed
                show
                return true
            else
                @@remaining -= 1
                @@guessed << guess
                show
                return true
            end
        else
            Display.new(0)
            exit
        end
    end

    def self.show
        Display.new(@@remaining)
        puts "#{@@show.join(" ")} (#{@@master.length} chars)"
        puts "Already Guessed: #{@@guessed.join(" ")}"
        puts "Guesses Remaining: #{@@remaining}"
    end
end