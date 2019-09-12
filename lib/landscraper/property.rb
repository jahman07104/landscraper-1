class Landscraper::Property
  attr_accessor :address, :price, :description
attr:
  def initialize(attributes={})
    attributes.each {|key, value| self.send(("#{key}="), value)}
    #   @address = attributes[:address] 
    #   @price = attributes[:price] 
    #   @description = attributes[:description] 
  end
   binding.pry
  def self.all
    @@all ||= self.create
    
  end

  def self.create
    Landscraper::Scraper.scrape.collect do |property_hash| 
    collection = self.new(property_hash)
      end
  end
  
end



