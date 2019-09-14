flow of my app
classes
  2a.class relationships

  user starts app and list for todays list of vailable properties
  user chooses number for info on property
  user gets info on pr0perties with location price and property type

Classes to be made 
properties =Property
cli to interact with the user = CLI
scraper class =Scraper


cli class

 class CLI
    
    def start
     puts "Welcome To Landscraper"
     puts "here are todays special properties"
     #method get_properties for user  = call self.create 
     puts "Make selection to view each property"
     puts "Make selection to view address and price"
     list_properties
     collection
     #property_hash
     #call self.all to return entire list
     menu_list
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
      press number to see details of each property
      DOC
      
    end
    def self.create

      Scraper.scrape.collect do |property_hash| 
         property_hash = self.new(property_hash)
         #[] << property_hash 
         property_hash.map {|x| x.values[0]}
        # property_hash.map {|x| x.keys}.uniq
         #binding.pry
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
      "puts all properties"
    end

    def goodbye
      puts "Good Bye visit us again soon"
    end
  end
end
*********************************************
friday night 10:18

what must my property App have

1.must have an address 
2.must have a price 
3.must have a description
(must have an url..??)

suggestion to lessen code from Beth
  # def  
       chosen_property= Property.all[input.to_i - 1]
       show_property(chosen_property)
       end
##line 24..***
#menu_list
        #property_hash #shows entire list with address price and description
        #collection.address shows address
        #**collection.price   shows price
        #**collection.description shows description
        #goodbye 
        #end
        #@property_hash = Property.all
      #binding.pry
      *************************************

      ##;line 59****

        def self.create
          Scraper.scrape.collect do |property_hash| 
          property_hash = self.new(property_hash)
          [] << property_hash 
          property_hash.map {|x| x.values[0]}
          property_hash.map {|x| x.keys}.uniq
          binding.pry
        end
    binding.pry
        end  
        *******************

        line 58
           def collection
            collection= Property.all.each.with_index(1) do |property,index|
            puts "#{index}. #{property}"      
          #end
        end
**************************

  #   #attr_accessor :property_hash
        
    
    # def initialize 
    #   @test= Property.new
    #   #@test.Property.create
    #   Landscraper::Property.all
    #   Property.create 
    #   #**to do save list of property objects to @@all
    #   #** to do use @@all in this class
    # end