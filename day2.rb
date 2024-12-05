
def part_1
    safe_reports = 0
    reports = File.read("day2.txt").split("\n")
    reports.each do |report|
        report = report.split(" ")
        last_value = 0
        descending = nil
        report.each_with_index do |level, i|
            level = level.to_i
            if i == 0
                last_value = level
                next
            elsif last_value == level
                break
            elsif i == 1
                descending = level < last_value
            end
            if descending
                if last_value - level >= 4
                    break
                elsif level > last_value
                    break
                end
            else
                if level - last_value >= 4
                    break
                elsif level < last_value
                    break
                end
            end
            if i == report.length-1
                safe_reports += 1
            end
            last_value = level
        end
    end
    puts safe_reports
end

