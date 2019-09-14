require 'nokogiri'
require 'open-uri'
require 'pry'


module Landscraper 
  class CLI
    #   #attr_accessor :property_hash
        
    
    # def initialize 
    #   @test= Property.new
    #   #@test.Property.create
    #   Landscraper::Property.all
    #   Property.create 
    #   #**to do save list of property objects to @@all
    #   #** to do use @@all in this class
    # end

    def call
      puts     "Welcome To Landscraper"
      #**list_properties=Property.create shows list of properties
      puts "here are Today's Properties"
      #see notes
      puts  "At anytime type select for featured properties of the day"
      puts "enter the number of your selection  or type exit to leave listing"
      input = nil

      #binding.pry
      while input != "exit"
        puts "enter the number of your selection  to see location, price and description or type exit to leave listing"
        input = gets.strip.downcase
        case input
        when"select"
            puts "todays properties.."
            list_properties
            
        when"1"
            puts "to see location.."
            @property.address
        when "2"
            puts "to see price.."
        when "3"
            puts "to see description.."
           
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
      puts "Here are todays special properties"
      @properties = Landscraper::Property.all
      @properties.each.with_index(1) do |property, i|

        #binding.pry 
        puts " #{i}.#{property.address}"
        puts " #{i}.#{property.price}"
        puts " #{i}.#{property.description}"
      end
    end
  end
end