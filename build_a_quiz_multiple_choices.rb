
class Hash
  def shuffle
    Hash[self.to_a.sample(self.length)]
  end

  def shuffle!
    self.replace(self.shuffle)
  end
end

def number_of_qustsion 
	puts "Please input the number of questions."
	input = gets.chomp
	while input.to_i.to_s != input
		puts "Please input a number!"
		input = gets.chomp
	end
	input.to_i
end 


def input_question
	puts "Please input the question: "
	gets.chomp.gsub((/\W$/), "")
end

def input_answer
	puts "Please input the answer to the question you just input: "
	gets.chomp
end

def quiz(all, number_of_question)
	score = 0
	all_answers = []
	all.each_value {|value| all_answers << value}

	if number_of_question == 1
		all.each do |question, answer|
			puts "#{question}?"
			input = gets.chomp
			if input == answer
				score += 1
				puts "Sweet! Your current score is #{score}."
			else
				puts "Oops... Wrong! The correct answer should be: #{answer}."
				puts "Your current score is #{score}."
			end	
		end

	elsif number_of_question == 2
		all.shuffle!.each do |question, answer|
			puts "#{question}?"
			puts "Please choose from below:"
			all_answers.shuffle!

			until all_answers[0..1].include?(answer)
				all_answers.shuffle!
			end

			puts "(A) #{all_answers[0]}"
			puts "(B) #{all_answers[1]}"

			input = gets.chomp

			 
			if (input.downcase == "a") && (all_answers[0] == answer)
				score += 1
				puts "Sweet! Your current score is #{score}."
			elsif (input.downcase == "b") && (all_answers[1] == answer)
				score += 1
				puts "Sweet! Your current score is #{score}."
			else
				puts "Oops... Wrong! The correct answer should be: #{answer}."
				puts "Your current score is #{score}."
			end

		end


	elsif number_of_question == 3
		all.shuffle!.each do |question, answer|
			puts "#{question}?"
			puts "Please choose from below:"
			all_answers.shuffle!

			until all_answers[0..2].include?(answer)
				all_answers.shuffle!
			end

			puts "(A) #{all_answers[0]}"
			puts "(B) #{all_answers[1]}"
			puts "(C) #{all_answers[2]}"

			input = gets.chomp

			 
			if (input.downcase == "a") && (all_answers[0] == answer)
				score += 1
				puts "Sweet! Your current score is #{score}."
			elsif (input.downcase == "b") && (all_answers[1] == answer)
				score += 1
				puts "Sweet! Your current score is #{score}."
			elsif (input.downcase == "c") && (all_answers[2] == answer)
				score += 1
				puts "Sweet! Your current score is #{score}."
			else
				puts "Oops... Wrong! The correct answer should be: #{answer}."
				puts "Your current score is #{score}."
			end

		end
	
	else
		all.shuffle!.each do |question, answer|
			puts "#{question}?"
			puts "Please choose from below:"
			all_answers.shuffle!

			until all_answers[0..3].include?(answer)
				all_answers.shuffle!
			end

			puts "(A) #{all_answers[0]}"
			puts "(B) #{all_answers[1]}"
			puts "(C) #{all_answers[2]}"
			puts "(D) #{all_answers[3]}"

			input = gets.chomp

			 
			if (input.downcase == "a") && (all_answers[0] == answer)
				score += 1
				puts "Sweet! Your current score is #{score}."
			elsif (input.downcase == "b") && (all_answers[1] == answer)
				score += 1
				puts "Sweet! Your current score is #{score}."
			elsif (input.downcase == "c") && (all_answers[2] == answer)
				score += 1
				puts "Sweet! Your current score is #{score}."
			elsif (input.downcase == "d") && (all_answers[3] == answer)
				score += 1
				puts "Sweet! Your current score is #{score}."
			else
				puts "Oops... Wrong! The correct answer should be: #{answer}."
				puts "Your current score is #{score}."
			end

		end
	end
	score
end

#program runner
if __FILE__ == $PROGRAM_NAME
	puts "Welcome! Press any key to start creating a quiz. Press Q to quit."
	input = gets.chomp

	until input.downcase == 'q'
		#input question numbers, questions and answers
		num = number_of_qustsion
		count = num
		all= Hash.new
		until count == 0
			count -= 1
			all[input_question]=input_answer
		end

		puts "Let's start the quiz now!"
		puts "Ready? Press Y to start; Press N to view all the questions and answers; Press Q to quit."
		user_input = gets.chomp

		until user_input.downcase == "q"

			if user_input.downcase == "y"
				system("clear")
				puts "Your final score is #{quiz(all, num)}."
			elsif user_input.downcase == "n" || user_input.downcase == "v"
				all.each do |question, answer|
					puts "Question: #{question}?"
					puts "Answer: #{answer}."
				end
			else
				puts "I'm sorry I don't understand."
			end
			puts "Press Y to do the quiz; Press V to view all the questions and answers; Press Q to quit the current quiz."
			user_input = gets.chomp
		end
		puts "Press Q to quit the program. Prese any key to start a new quiz."
		input = gets.chomp
		system("clear")
	end

	puts "Thanks for using the program. Bye!"	
end
