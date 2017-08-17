def triple_double(num1,num2)
  return 1 if two(num2.to_s, three(num1.to_s))
  return 0
end

def three(str)
  count = 1
  last = '0'
  pattern = []
  str.each_char do |c| 
    c == last ? (count+=1) : (count=1)
    last = c 
    if count==3
      pattern << c 
      count = 1
    end 
  end
  pattern 
end

def two(str, pattern)
  count = 0 
  pattern.each do |p|
    str.each_char do |c|
      c == p ? (count+=1) : (count=0)
      return true if count == 2 
    end
  end
  return false 
end

puts triple_double(2158555466834873666417,18661)
puts triple_double(231118955543, 455590)