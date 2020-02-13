require "letter"

class LetterGenerator

    def generate
        randomAlphabets = (0...16).map { ('A'..'Z').to_a[rand(26)] }
        letters = Array.new
        row = 0
        column = 0
        randomAlphabets.each_with_index do |l, i|
            if i % 4
                row = row + 1
                column = 0
            end
            letters << Letter.new(l, row, column)        
        end
        letters
    end
end
