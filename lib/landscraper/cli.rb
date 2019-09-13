require 'nokogiri'
require 'open-uri'
require 'pry'


module Landscraper 
  class CLI
    @@all = []
    
    def initialize 
     
     #@test= Property.new
     #@test.Property.create
     list_properties=Property.create 
     #save list of property objects to @@all
     #use @@all in this class
     #binding.pry
    end
    
    def start
     puts "Welcome To Landscraper"
     puts "here are todays special properties"
     list_properties=Property.create 
     #method get_properties for user  = call self.create 
     puts "Make selection to view each property"
     collection
     #need list of collection
     list_properties
     puts "Make selection to view address and price"
    # collection.address
     #collection.price
     #collection.description
     
     menu_list
     #property_hash
     #call self.all to return entire list
     #make selection
     # call self.create to return listing (location, property_type, price)
     goodbye
     #create 
    
     #menu_list 
    end

    def list_properties
      #show listings
      
      puts  <<-DOC
      Type select for featured properties of the day
      input = gets.strip
      press number to see details of each property
      input = gets.strip
      DOC
      
    end

    def self.create

      Scraper.scrape.collect do |property_hash| 
         property_hash = self.new(property_hash)
         #[] << property_hash 
         #property_hash.map {|x| x.values[0]}
        # property_hash.map {|x| x.keys}.uniq
        # binding.pry
      end
#binding.pry
    end  

    def collection
       # collection= Property.all.each.with_index(1) do |property,index|
          #    address = property.css(".address").text.strip
              #puts "#{index}. #{property}"
   # binding.pry      
          #end
      end

   
    def menu_list
      puts "enter the number of your selection  to see location, price and description or type exit to leave listing"
      input=nil
    while input != "exit"
      input = gets.strip.downcase
    case input
    when"select"
      puts "todays properties.."
      when"1"
      puts "More info on property 1.."
      when "2"
      puts "More info on property 2.."
    when "3"
      puts "More info on property 3.."
    when "4"
      puts "More info on property 4.."
    when "5"
      puts "More info on property 5.."
    when "6"
      puts "More info on property 6.."
    when "7"
      puts "More info on property 7.."
    when "8"
      puts "More info on property 8.."
    when "9"
      puts "More info on property 9.."
    when "10"
      puts "More info on property 10.."  

    # else
    #   puts "\n Input error,please try your selection again"   
        end
      end
     end

     def self.all
      @@all ||= self.create
      [] << @@all 
      "puts all properties"
    end

    def goodbye
      puts "Good Bye visit us again soon"
    end
  end
end
