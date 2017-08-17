def triple_double(num1,num2)
  return 0 if check_repeat(num1.to_s, 3, []) == []
  res = check_repeat(num2.to_s, 2, check_repeat(num1.to_s, 3, []))
  return 1 if res && res!=[]
  return 0
end

# write a function to check different patterns
def check_repeat(str, time, pattern)
  count = 0
  if pattern == [] 
    last = '0'
    str.each_char do |c| 
      c == last ? (count+=1) : (count=0)
      last = c 
      if count==time-1
        pattern << c 
        count = 0
      end 
    end
    return pattern
  else 
    pattern.each do |p|
      str.each_char do |c|
        c == p ? (count+=1) : (count=0)
        return true if count == time  
      end
    end
  end
  return false 
end 



=begin
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
=end 

puts triple_double(2158555466834873666417,18661)
puts triple_double(231118955543, 455590)