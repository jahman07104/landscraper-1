require'pry'
module Landscraper
  class Scraper
    def self.scrape
      site = "https://www.realtor.com/international/jm/rent/"
      page = Nokogiri::HTML(open(site))
      properties = page.css("div.listings-wrapper li.listing") .collect do |property|
         {
          address: property.css(".address").text.strip,
          price: property.css("p.exchanged-price.specified strong").text,
          description: property.css("div.propertytype").text.strip
         } 
      end
    end
  end
end