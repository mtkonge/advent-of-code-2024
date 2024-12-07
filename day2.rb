
def report_is_safe(report)
    last_level = nil
    descending = nil
    report.each_with_index do |level, i|
        level = level.to_i
        if i == 0
            last_level = level
            next
        elsif last_level == level
            break
        elsif i == 1
            descending = level < last_level
        end
        if descending
            if last_level - level >= 4
                break
            elsif level > last_level
                break
            end
        else
            if level - last_level >= 4
                break
            elsif level < last_level
                break
            end
        end
        if i == report.length-1
            return true
        end
        last_level = level
    end
    return false
end

def part_1
    safe_reports = 0
    reports = File.read("day2.txt").split("\n")
    reports.each do |report|
        report = report.split(" ")
        safe_reports += 1 if report_is_safe(report)
    end
    puts safe_reports
end

def part_2
    safe_reports = 0
    reports = File.read("day2.txt").split("\n")
    reports.each do |report|
        report = report.split(" ")
        report_test_cases = []
        report.each_with_index do |level, i|
            report_clone = report.clone
            report_clone.delete_at(i)
            if report_is_safe(report_clone)
                safe_reports += 1
                break
            end
        end
    end
    puts safe_reports
end
