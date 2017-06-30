player_score = 0
computer_score = 0
game = %w(rock paper scissors)
compare = {rock: 1, paper: 2, scissors: 3} 

until player_score == 5 || computer_score == 5

	puts "Please choose from rock, paper, and scissors:"
	player_input = gets.chomp.downcase

	unless game.include?(player_input)
		puts "Wrong input!"
	else
		computer_input = game[rand(3)]
		puts "Computer: #{computer_input}"
		if compare[player_input.to_sym] > compare[computer_input.to_sym]
			if (player_input == "scissors") && (computer_input == "rock")
				computer_score += 1
				puts "Your score is #{player_score}. Computer score is #{computer_score}."
			else
				player_score += 1
				puts "Your score is #{player_score}. Computer score is #{computer_score}."
			end
		elsif compare[player_input.to_sym] < compare[computer_input.to_sym]
			if (player_input == "rock") && (computer_input == "scissors")
				player_score += 1
				puts "Your score is #{player_score}. Computer score is #{computer_score}."
			else
				computer_score += 1
				puts "Your score is #{player_score}. Computer score is #{computer_score}."
			end
		else 
			puts "Your score is #{player_score}. Computer score is #{computer_score}."
		end
	end
end

puts "You win!!!" if player_score > computer_score
puts "You lose...." if computer_score > player_score
