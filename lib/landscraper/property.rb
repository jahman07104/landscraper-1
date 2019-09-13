module Landscraper
  class Property
    attr_accessor :address, :price, :description 
    
    def initialize(attributes={})
      attributes.each {|key, value| self.send(("#{key}="), value)}
      
    end
    
    def self.all
      @@all ||= self.create
     # binding.pry
    end

    def self.create

      Scraper.scrape.collect do |property_hash| 
        collection = self.new(property_hash)
         collection.address
         collection.description
         collection.price
         collection.address
        
      end
    end
    
  end
end



