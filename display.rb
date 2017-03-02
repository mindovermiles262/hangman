=begin

display.rb provides a graphical interaction for the hangman game.  An integer argument (i < 6) corresponding on the 
number of wrong guesses remaining is passed to the class where the proper noose is displayed.  With no turns remaining, 
the noose shows a hangman with "GAME OVER" displayed underneath

=end
class Display
    def initialize(remain)
        case remain
            when 6; six
            when 5; five
            when 4; four
            when 3; three
            when 2; two
            when 1; one
            when 0; zero
        end
    end

    def six
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

    def five
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

    def four
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

    def two
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

    def one
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

    def zero
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