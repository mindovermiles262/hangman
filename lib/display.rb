=begin

display.rb provides a graphical interaction for the hangman game.  An integer argument (i < 6) corresponding on the 
number of wrong guesses in the game is passed to the class where the proper stage of noose is displayed.  With six wrong
guesses, the noose shows a hangman with "GAME OVER" displayed underneath

=end
class Display
    def initialize(remain)
        case remain
            when 0; zero
            when 1; one
            when 2; two
            when 3; three
            when 4; four
            when 5; five
            when 6; six            
        end
    end

    def zero
        puts "||====== "
        puts "||    \\ "
        puts "||"
        puts "||"
        puts "||"
        puts "||"
        puts "||"
        puts "||"
        puts "||"
        puts "============"
    end

    def one
        puts "||====== "
        puts "||    \\ "
        puts "||    () "
        puts "||"
        puts "||"
        puts "||"
        puts "||"
        puts "||"
        puts "||"
        puts "============"
    end

    def two
        puts "||====== "
        puts "||    \\ "
        puts "||    () "
        puts "||    || "
        puts "||    || "
        puts "||    ||"
        puts "||"
        puts "||"
        puts "||"
        puts "============"
    end

    def three
        puts "||====== "
        puts "||    \\ "
        puts "||    () "
        puts "||   /|| "
        puts "||  / || "
        puts "||    ||"
        puts "||"
        puts "||"
        puts "||"
        puts "============"
    end

    def four
        puts "||====== "
        puts "||    \\ "
        puts "||    () "
        puts "||   /||\\ "
        puts "||  / || \\ "
        puts "||    ||"
        puts "||"
        puts "||"
        puts "||"
        puts "============"
    end

    def five
        puts "||====== "
        puts "||    \\ "
        puts "||    () "
        puts "||   /||\\ "
        puts "||  / || \\ "
        puts "||    ||"
        puts "||   /"
        puts "||  /"
        puts "|| ~"
        puts "============"
    end

    def six
        puts "||====== "
        puts "||    \\ "
        puts "||    () "
        puts "||   /||\\ "
        puts "||  / || \\ "
        puts "||    ||"
        puts "||   /  \\ "
        puts "||  /    \\ "
        puts "|| ~      ~"
        puts "============"
        puts "  GAME OVER"
    end
end
#Display.new(6)
#Display.new(5)
#Display.new(4)
#Display.new(3)
#Display.new(2)
#Display.new(1)
#Display.new(0)