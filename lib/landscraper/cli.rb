require 'nokogiri'
require 'open-uri'
require 'pry'


module Landscraper 
  class CLI
    def call
      puts     "Welcome To Landscraper"
      list_addresses#
      puts  "Type list to display todays Properties Prices and Descriptions"
      puts   "Type 1 to see just addresses"
      puts   "Type 2 to see price range and description" 
      puts   "Type exit to leave listing"

      input = nil

      #binding.pry
      while input != "exit"
        #puts "Type select enter"
        input = gets.strip.downcase
        case input
        when"select"
            puts "todays properties.."
            list_properties
            puts "Type 4 to return to main menu"
        when"1"
            puts "to see location.."
            list_addresses
            puts "Type 4 to return to main menu"
        when "2"
            puts "to see price range and description .."
            list_price_description
            puts "Type 4 to return to main menu"
        when "4"
          puts     "Welcome To Landscraper"
          list_addresses#
          puts  "Type list to display todays Properties Prices and Descriptions"
          puts   "Type 1 to see just addresses"
          puts   "Type 2 to see price range and description" 
          puts   "Type exit to leave listing"
           
        when "list"
             list_properties
        when "exit"
            goodbye 
        else
            puts "\n Input error,please try your selection again" 
        end  
    
      end
    end

    def goodbye
      puts "Good Bye "
      puts"visit us again soon" 
      puts      "or"
      puts "Call 1-800-555-5555 to speak to our Agents" 
    end
    def list_properties
      puts " Todays special properties"
      @properties = Landscraper::Property.all
      @properties.each.with_index(1) do |property, i|
        puts " #{i}.#{property.address}"
        puts " #{i}.#{property.price}"
        puts " #{i}.#{property.description}"
      end
    end
    def list_addresses
      puts "Here are todays special properties..!!!"
      @properties = Landscraper::Property.all
      @properties.each.with_index(1) do |property, i|

        #binding.pry 
        puts " #{i}.#{property.address}"
      end
    end
    def list_price_description
      puts "Here are todays special properties"
      @properties = Landscraper::Property.all
      @properties.each.with_index(1) do |property, i|

        #binding.pry 
        puts " #{i}.#{property.price}"
        puts " #{i}.#{property.description}"
      end
    end
  end
end