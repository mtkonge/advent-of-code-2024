


def page_number_update_complies_with_rules(rules, page_number_update)
    page_number_update.each_with_index do |page_number, i|
        rules.each do |rule|
            if page_number == rule[1]
                (i..page_number_update.length-1).each do |page_number_after_index|
                    if page_number_update[page_number_after_index] == rule[0]
                        return false
                    end
                end
            end
        end
    end
    return true
end

def part_1
    page_order_rules = File.read("day5_rules.txt").split("\n").map { |line| line.split("|") }
    page_number_updates = File.read("day5_updates.txt").split("\n").map { |line| line.split(",") }

    sum = 0
    page_number_updates.each do |page_number_update|
        if page_number_update_complies_with_rules(page_order_rules, page_number_update)
           sum += page_number_update[((page_number_update.length-1)/2).to_i].to_i
        end
    end
    puts sum
end

def part_2
    page_order_rules = File.read("day5_rules.txt").split("\n").map { |line| line.split("|") }
    page_number_updates = File.read("day5_updates.txt").split("\n").map { |line| line.split(",") }
    
    sum = 0

end