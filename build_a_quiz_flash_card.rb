
=begin
class Hash
  def shuffle
    Hash[self.to_a.sample(self.length)]
  end

  def shuffle!
    self.replace(self.shuffle)
  end
end
=end

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

def quiz(all)
	score = 0
	all.keys.shuffle!.each do |question|
		puts question
		input = gets.chomp
		if input.downcase == all[question].downcase
			score += 1
			puts "Sweet! Your current score is #{score}."
		else
			puts "Oops... Wrong! The correct answer should be: #{all[question]}."
			puts "Your current score is #{score}."
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
		all= Hash.new
		until num == 0
			num -= 1
			all[input_question]=input_answer
		end

		puts "Let's start the quiz now!"
		puts "Ready? Press Y to start; Press N to view all the questions and answers; Press Q to quit."
		user_input = gets.chomp

		until user_input.downcase == "q"

			if user_input.downcase == "y"
				system("clear")
				puts "Your final score is #{quiz(all)}."
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
