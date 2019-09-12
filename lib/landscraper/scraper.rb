require'pry'

class Landscraper::Scraper

  def self.scrape
    site = "https://www.realtor.com/international/jm/rent/"
    page = Nokogiri::HTML(open(site))
    properties = page.css("div.listings-wrapper li.listing") .collect do |property|
      collection = Landscraper::Property.new   
      collection.address = property.css(".address").text.strip
      collection.price = property.css("p.exchanged-price.specified strong").text
      collection.description =property.css("div.propertytype").text.split
      #binding.pry
    end
  end


end