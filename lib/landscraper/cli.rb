require 'nokogiri'
require 'open-uri'
require 'pry'


module Landscraper 
  class CLI
    def call
      puts  "Welcome To Landscraper".colorize(:green)
      puts  " "
      list_addresses
      puts  " "
      puts  "Type list to display todays Properties Prices and Descriptions".colorize(:green)
      puts  " "
      puts  "Type Choice to see induvidual properties".colorize(:yellow)
      puts  " "
      puts  "Type exit to leave the listing".colorize(:red)
      input = nil
      while input != "exit"
      input = gets.strip.downcase
      case input
      when"list"
      puts "todays properties..".colorize(:red)
      puts " "
      list_properties
      puts "Type Menu to return to main Menu".colorize(:green)
      when"address"
      puts "to see location..".colorize(:yellow)
      list_addresses
      puts "Type Menu to return to main Menu".colorize(:green)
      when "prices"
      puts "to see price range and description .."
      list_price_description
      puts "Type Menu to return to main Menu".colorize(:green)
      when "menu"
      puts "Welcome To Landscraper".colorize(:green)
      list_addresses
      puts "Type list to display todays Properties Prices and Descriptions".colorize(:yellow)
      puts "Type address to see just addresses".colorize(:yellow)
      puts "Type Prices to see price range and description".colorize(:yellow)
      puts  "Type Choice to see induvidual properties".colorize(:yellow)
      puts "Type exit to leave listing".colorize(:red)
      when "choice"
      puts " enter number to see property".colorize(:yellow)
      puts =""
      choice
      when "list"
      puts "Type Menu to return to main Menu".colorize(:green)
      when "exit"
      goodbye 
      else
      puts "\n Input error,please try your selection again".colorize(:red)
      end
    end
    end

    def goodbye
      puts "Good Bye ".colorize(:red)
      puts "visit us again soon" .colorize(:red)
      puts "or".colorize(:green)
      puts "Call 1-800-555-5555 to speak to our Agents".colorize(:red)
    end

    def choice
      input = ""
      puts = ""
      list_addresses
      input = gets.chomp.to_i
      if (1..10).include?(input.to_i)
      @property = Landscraper::Property.all[input.to_i-1]
      puts " #{@property.address}"
      puts " #{@property.price}"
      puts " #{@property.description}"
      puts""
      puts"To make another choice Type choice again and choose number " .colorize(:red)
      puts "Type Menu to return to main Menu".colorize(:green)     
      else
      false
      puts "\n Input error,please try your selection again" .colorize(:red)
      input = gets.chomp.to_i-1
      end
    end

    def list_properties
      puts " "
      puts " Todays special properties".colorize(:green)
      puts " "
      @properties = Landscraper::Property.all
      @properties.each.with_index(1) do |property, i|
      puts " #{i}.  #{property.address}"
      puts "     #{property.price}"
      puts "     #{property.description}"
      end
    end

    def list_addresses
      puts "Here are Todays special Properties..!!!".colorize(:green)
      puts " "
      @properties = Landscraper::Property.all
      @properties.each.with_index(1) do |property, i|
      puts " #{i}. #{property.address}"
      puts " "
      end
    end

    def list_price_description
      puts "Todays Properties and Prices".colorize(:red)
      @properties = Landscraper::Property.all
      @properties.sort! {|y,x| y.price.gsub("USD $","").gsub(",", "").to_i <=> x.price.gsub("USD $","").gsub(",", "").to_i}
      @properties.each.with_index(1) do |property, i| 
       puts " #{i}.#{property.price}"
      end
    end
  end
end