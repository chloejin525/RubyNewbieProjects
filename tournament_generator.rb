module Menu 
	def menu 
		"Welcome to My Tournament Generator. Enter a selection:
		1. Enter teams
		2. List teams
		3. List matchups
		0. Exit Program "
	end

	def show_menu
    	menu
    end
end

module Promptable
	def prompt(message = "what would you like to do?")
		puts message
		gets.chomp
	end
end



class Team 
	attr_accessor :name, :seed 

	def initialize(name, seed)
		@name = name.strip.capitalize
		@seed = seed
	end

end

class Match

	attr_accessor :all_team

	def initialize
		@all_team = {}
	end

	def add(name, seed)
		@all_team[name] = seed
	end

	def sort
		#create a sorted array
		sorted_array = all_team.sort_by {|_key, value| value} 
		#return a sorted hash with sorted_array
		Hash[sorted_array]
	end

	def all_seeds
		@all_team.values
	end

	def all_names
		@all_team.keys
	end

	def delete(name, seed)
		if @all_team[name] == seed
			@all_team.delete(name)
		end
	end

	def check_seed(name)
		@all_team[name]
	end

	def check_team(seed)
		@all_team.key(seed)
	end

	def list_match
		all_team = sort
		teams_sorted = all_team.keys
		number_of_teams = all_team.length

		if (number_of_teams % 2) == 0
			count = 0
			until count == (number_of_teams/2)
				puts "(#{all_team[teams_sorted[count]]}) #{teams_sorted[count]} versus (#{all_team[teams_sorted[number_of_teams-count-1]]}) #{teams_sorted[number_of_teams-count-1]}"
				count += 1
			end

		else
			puts "(#{all_team[teams_sorted[0]]}) #{teams_sorted[0]} has a bye"
			count = 1
			until count == (number_of_teams+1)/2
				puts "(#{all_team[teams_sorted[count]]}) #{teams_sorted[count]} versus (#{all_team[teams_sorted[number_of_teams-count]]}) #{teams_sorted[number_of_teams-count]}"
				count += 1
			end

		end

	end
end

if __FILE__ == $PROGRAM_NAME
	include Menu
	include Promptable 
	all_team = Match.new 
	until ['0'].include?(user_input = prompt(show_menu))
		case user_input
		when '1'
			until ['n'].include?(user_input = prompt("Would you like to add teams? (Enter Y to continue. Enter N to return to main menu.)"))
				case user_input.downcase
				when 'y'	
					# check if the team is already in the system
					new_team = Team.new(prompt("Please enter team name: "), prompt("Please enter team seed: ").to_i)
					if all_team.all_names.include?(new_team.name) && all_team.all_seeds.include?(new_team.seed)
						puts "The team with the same seed is already in the system!"
					elsif all_team.all_names.include?(new_team.name)
						team_name = new_team.name
						team_seed = new_team.seed
						all_team.delete(new_team.name, new_team.seed)
						puts "#{team_name} is already in the system! Its seed is #{all_team.check_seed(team_name)}." 
						# to update the team's seed
						if ['y'].include?(prompt("Would you like to update its seed? Press Y to update the seed. Press any other key to add more teams.").downcase)
							new_team = Team.new(team_name, team_seed)
							while all_team.all_seeds.include?(new_team.seed)
								new_team.seed = prompt("#{new_team.seed} has already been used by #{all_team.check_team(new_team.seed)}. Please re-enter seed: ").to_i
							end
							all_team.add(new_team.name, new_team.seed)
						end
					else
					# if the team is not in the system, check if its seed number is already used. 
						while all_team.all_seeds.include?(new_team.seed)
							new_team.seed = prompt("#{new_team.seed} is already used by #{all_team.check_team(new_team.seed)}. Please re-enter seed: ").to_i
						end	

						all_team.add(new_team.name, new_team.seed)
					end
					
				else
					puts "I don't know what you mean."
				end
			end
		when '2'
			all_team.sort.each {|name, seed| puts "#{seed}. #{name}"}
		when '3'
			all_team.list_match
		else
			puts "Wrong input!"
		end

	end
	puts "Thanks for using My Tournament Generator!"
end
