#a category class, each category has different products
require 'date'

class IndividualCategory
	attr_accessor :category
	attr_reader :name
	
	def initialize(name)
		@name = name.capitalize
		@category = []
		
	end

	def add(product)
		@category << product
	end

	def all_products
		@all_products = []
		category.each {|product| all_products << product.name}
		@all_products
	end

	def search_by_name(name)
		unless @category.any? { |product| product.name.downcase == name.downcase}
			puts "                      Product not found!" 
			puts "                        -----End-----"
		end
		@category.find { |product| product.name.downcase == name.downcase}
=begin
		@category.each do |product|
			if product.name.downcase == name.downcase
				return product
			else
				puts "Product not found!"
			end
		end
=end
	end

	def search_by_serial_number(serial_number)
		unless @category.any? { |product| product.serial_number.downcase == serial_number.downcase}
			puts "                      Product not found!" 
			puts "                        -----End-----"
		end
		@category.find { |product| product.serial_number.downcase == serial_number.downcase}
	end

	def list
		
		puts "--------------------------------------------------------------"
		@category.each do |product|
			product.print_detail
		end
		puts "                        -----End-----"
	end

	def expire_soon
		@category_sorted = @category.sort_by {|product| product.sell_by_date }
		puts "--------------------------------------------------------------"
		
		@in_a_week = (Time.now + 7 * 86400).strftime("%Y-%m-%d")
		@count = 0
		puts "        The following product(s) have to be sold within a week (by #{@in_a_week})!"
		
		@category_sorted.each do |product|
			if product.sell_by_date < @in_a_week
				product.print_detail 
				@count += 1
			end
		end
		puts "            No products found. Good job!" if @count == 0
		puts "                        -----End-----"

	end

end

class Product
	attr_reader :name, :serial_number, :original_price, :sell_by_date
	attr_accessor :quantity, :cost, :sell_price, :sale_if
	

	def initialize(name, quantity, serial_number, cost, sell_price, sell_by_date)
		@name = name
		#everything below needs to_i
		@quantity = quantity.to_i
		@serial_number = serial_number
		@cost = cost.to_f
		@sell_price = sell_price.to_f
		@original_price = sell_price.to_f
		#use date objects for this
		#@sell_by_date = expire + Time.now.
		@sale_if = "N" 
		@sell_by_date = sell_by_date.strftime("%Y-%m-%d")

	end

	def print_detail
		puts "[#{name.upcase}] Quantity: #{quantity} | Cost: $#{cost} | Sold at: $#{sell_price} | Sale: #{sale_if} | Sell by: #{sell_by_date} | Serial number: #{serial_number}"
		puts "--------------------------------------------------------------"
	end

	def add(amount)
		@quantity += amount.to_i
		puts "The quantity is now: #{quantity}."
	end

	def sold(amount)
		while amount.to_i > @quantity 
			puts "You cannot sell more than you have in stock!!!"
			amount = gets.chomp
		end
		@quantity -= amount.to_i
		puts "The quantity is now: #{quantity}."
	end

	def sale(percent)
		percent = (percent.to_f)/100
		@sell_price = (@sell_price * (1-percent)).round(2)
		puts "The price after sale is $#{sell_price}."
		@sale_if = "Y"
	end

	def remove_sale
		@sell_price = @original_price
		@sale_if = "N"
		puts "The price is now $#{sell_price}"
	end

	def totoal_cost
		@cost * @quantity 
	end

	def total_revenue
		@sell_price * @quantity
		
	end

	def total_profit
		(@sell_price - @cost) * @quantity
	end

end