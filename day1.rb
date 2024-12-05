
def part_1
  pairs_text = File.read("day1.txt").split("\n")
  
  left_values = []
  right_values = []
  
  pairs_text.each do |pair|
    left_values.append(pair[0..4].to_i)
    right_values.append(pair[8..12].to_i)
  end
  
  left_values = left_values.sort
  right_values = right_values.sort
  
  sum = 0
  left_values.each_with_index do |left_value, i|
    right_value = right_values[i]
    puts "right: #{right_value}"
    puts "left: #{left_value}"
  
    if left_value > right_value
      sum += left_value - right_value
    else
      sum += right_value - left_value
    end
  
  end
  puts sum
end

def part_2
  pairs_text = File.read("day1.txt").split("\n")
  
  left_values = []
  right_values = []
  
  pairs_text.each do |pair|
    left_values.append(pair[0..4].to_i)
    right_values.append(pair[8..12].to_i)
  end
  
  left_values = left_values.sort
  right_values = right_values.sort
  
  similarity_score = 0
  left_values.each_with_index do |left_value, l_i|
    count = 0
    right_values.each_with_index do |right_value, r_i|
      if left_value == right_value 
        count += 1
      elsif right_values.length-1 == r_i
        similarity_score += left_value*count
      end
    end
  end
  puts similarity_score
end

part_2