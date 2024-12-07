
def part_1
    memory = File.read("day3.txt")
    muls = memory.scan(/mul\(\d{1,3},\d{1,3}\)|/)
    sum = 0
    muls.each do |mul| 
        numbers_to_multiply = mul.scan(/\d{1,3}/)
        sum += numbers_to_multiply[0].to_i * numbers_to_multiply[1].to_i
    end
    puts sum
end

def part_2
    memory = File.read("day3.txt")
    commands = memory.scan(/mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/)
    sum = 0
    should_multiply = true
    commands.each do |command|
        if command == "do()"
            should_multiply = true
        elsif command == "don't()"
            should_multiply = false
        else
            if should_multiply
                should_multiply
                numbers_to_multiply = command.scan(/\d{1,3}/)
                sum += numbers_to_multiply[0].to_i * numbers_to_multiply[1].to_i
            end
        end
    end
    puts sum
end