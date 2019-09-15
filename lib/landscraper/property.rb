module Landscraper
  class Property
    attr_accessor :address, :price, :description 
    
    def initialize(attributes={})
      attributes.each {|key, value| self.send(("#{key}="), value)}
    end

    def self.all
      @@all ||= self.create
    end

    def self.create
      Scraper.scrape.collect do |property_hash| 
        collection = self.new(property_hash)
      end
    end
  end
end



