class Landscraper::Property

    attr_accessor :address, :price, :description
 
 def initialize(attributes={})
 attributes.each {|key, value| self.send(("#{key}="), value)}
#   @address = attributes[:address] 
#   @price = attributes[:price] 
#   @description = attributes[:description] 
  end

  def self.all
    @@all ||= self.create
    
   binding.pry
   end


   def self.create
    Landscraper::Scraper.scrape.collect do |property_hash| 
        collection = self.new(property_hash)
    end
end
  
end



