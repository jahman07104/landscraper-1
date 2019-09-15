require 'nokogiri'
require 'open-uri'
require 'pry'


module Landscraper 
  class CLI
    def call
      puts     "Welcome To Landscraper".colorize(:green)
      puts  " "
      list_addresses
      puts " "
      puts  "Type list to display todays Properties Prices and Descriptions".colorize(:yellow)
      puts   "Type 1 to see just addresses".colorize(:yellow)
      puts   "Type 2 to see price range and description" .colorize(:yellow)
      puts   " "
      puts   "Type exit to leave the listing".colorize(:red)
      input = nil
      while input != "exit"
        #puts "Type select enter"
        input = gets.strip.downcase
        case input
        when"select"
            puts "todays properties..".colorize(:red)
            puts " "
            list_properties
            puts "Type Menu to return to main Menu".colorize(:green)
        when"1"
            puts "to see location..".colorize(:yellow)
            list_addresses
            puts "Type Menu to return to main Menu".colorize(:green)
        when "2"
            puts "to see price range and description .."
            list_price_description
            puts "Type Menu to return to main Menu".colorize(:green)
        when "menu"
          puts     "Welcome To Landscraper".colorize(:red)
          list_addresses#
          puts  "Type list to display todays Properties Prices and Descriptions"
          puts   "Type 1 to see just addresses"
          puts   "Type 2 to see price range and description"
          puts   "Type exit to leave listing"
        when "list"
             list_properties
             puts "Type Menu to return to main Menu".colorize(:green)
        when "exit"
            goodbye 
        else
            puts "\n Input error,please try your selection again" .colorize(:red)
        end  
    
      end
    end
    def goodbye
      puts "Good Bye ".colorize(:red)
      puts "visit us again soon" .colorize(:red)
      puts      "or".colorize(:green)
      puts "Call 1-800-555-5555 to speak to our Agents" .colorize(:red)
    end
    def list_properties
      puts " "
      puts " Todays special properties".colorize(:red)
      @properties = Landscraper::Property.all
      @properties.each.with_index(1) do |property, i|
        puts " #{i}.#{property.address}"
        puts " #{i}.#{property.price}"
        puts " #{i}.#{property.description}"
      end
    end

    def list_addresses
      puts "Here are todays special properties..!!!".colorize(:red)
      puts " "
      @properties = Landscraper::Property.all
      @properties.each.with_index(1) do |property, i|
        puts " #{i}.#{property.address}"
      end
    end

    def list_price_description
      puts "Here are todays special properties".colorize(:red)
      @properties = Landscraper::Property.all
      @properties.each.with_index(1) do |property, i| 
        puts " #{i}.#{property.price}"
        puts " #{i}.#{property.description}"
      end
    end
  end
end