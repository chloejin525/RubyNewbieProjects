def encrypt(text, n)
  #your code here
  return text if n<=0
  new_str= []
  text.chars.each_with_index {|c, i| new_str<< c if i%2 != 0}
  text.chars.each_with_index {|c, i| new_str<< c if i%2 == 0}
  encrypt(new_str.join, n-1)
end

def decrypt(encrypted_text, n)
  #your code here
  return encrypted_text if n<=0
  new_str= Array.new(encrypted_text.length)
  first_half = []
  second_half = []
  
  encrypted_text.chars.each_with_index do |c, i| 
    first_half << c if i < (encrypted_text.length/2)
  end 
  
  encrypted_text.chars.each_with_index do |c, i| 
    second_half << c if i >= (encrypted_text.length/2)
  end 
  
  new_str.each_with_index do |n, i|
    new_str[i] = second_half[i/2] if i % 2 == 0 
    new_str[i] = first_half[i/2] if i % 2 != 0 
  end 
  
  decrypt(new_str.join, n-1)
  
end

puts decrypt("hskt svr neetn!Ti aai eyitrsig", 1) == "This kata is very interesting!"
puts encrypt("This kata is very interesting!", 1) == "hskt svr neetn!Ti aai eyitrsig"