require 'nokogiri'
require 'open-uri'
require'pry'


module Landscraper 
    #attr_accessor :collection
    class CLI
    #@collection = collection
       def start
        puts "Welcome To Landscraper"
        puts "here are todays special properties"
        #method get_properties for user  = call self.create 
        puts "Make selection to view each property"
        list_properties
        #call self.all to return entire list
        menu_list
        #make selection
        # call self.create to return listing (location, property_type, price)

        goodbye
        
       end

       def list_properties
          #show listings
        puts  <<-DOC
        1.Press select for featured properties of the day
        2.press number to see details of each property
        
         DOC
        # self.all
         #binding.pry
    end
    

    def collection
              collection=property.new.address.each.with_index(1) do |index,property|
               address = property.css(".address").text.strip
               puts "#{index}. #{property}"
          binding.pry      
            end
    end



    #choose
    def menu_list
          puts "enter the number of your selection  to see location, price and description or type exit leave listing"
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
        else
            puts "\n Input error,please try your selection again"   
            

           end
       end
    end

    def goodbye
        puts "Good Bye visit us again soon"
    end

end
 end
