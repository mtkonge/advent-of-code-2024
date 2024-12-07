
# B)
class Array
    alias_method :original_brackets, :[]
  
    def [](index)
      return nil if index < 0
      original_brackets(index)
    end
  end

def part_1
    word_puzzle = File.read("day4.txt").split("\n").map {|line| line.split("")}
    xmas_amount = 0
    word_puzzle.each_with_index do |line, y|
        word_puzzle.each_with_index do |char, x|
            horizontals = [
                        [[x,y], [x+1,y], [x+2,y],[x+3,y]], 
                        [[x,y], [x-1,y], [x-2,y], [x-3,y]]
                        ]
            verticals = [
                        [[x,y], [x,y+1], [x,y+2],[x,y+3]], 
                        [[x,y], [x,y-1], [x,y-2], [x,y-3]]
                        ]
            diagonals = [
                        [[x,y], [x+1,y+1], [x+2,y+2],[x+3,y+3]], 
                        [[x,y], [x-1,y-1], [x-2,y-2], [x-3,y-3]], 
                        [[x,y], [x+1,y-1], [x+2,y-2],[x+3,y-3]], 
                        [[x,y], [x-1,y+1], [x-2,y+2], [x-3,y+3]]
                        ]
            

            (horizontals + verticals + diagonals).each do |word_indexes|
                word = ""
                word_indexes.each do |index|
                    line = word_puzzle[index[1]]
                    if line.nil?
                        next
                    end
                    char = line[index[0]]
                    if char.nil?
                        next
                    else
                        word += char
                    end
                end
                xmas_amount += 1 if word == "XMAS"
            end
        end
    end
    puts xmas_amount
end

