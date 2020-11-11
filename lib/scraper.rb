# Set up like a class
# Responsible for talking with our API 
require 'nokogiri'
require 'open-uri'


class Scraper 
    def self.scrape_models
        #puts ["Bugatti Chiron", "Bugatti Pursport", "Chiron Super Sport"]  
      doc = Nokogiri::HTML(open("https://www.bugatti.com/models/chiron-models/"))
      
      models = doc.css("figcaption.collage-item-caption")
      #figcaption HTML tag on bugatti website that contains string with model names.
      
      models.map do |model|
          model.text
       end 
    end 
    
    def self.scrape_model1
        
     doc = Nokogiri::HTML(open("https://www.bugatti.com/chiron/"))
      
       info = doc.css("div.text-inner").text 
      # models.map do |model|
    #       model.text
    #    end 
    end 
    def self.scrape_model2
        doc = Nokogiri::HTML(open("https://www.caranddriver.com/news/a31210941/bugatti-chiron-pur-sport-photos-info/"))
      
        info = doc.css("p.body-text").text 
    end
    
    def self.scrape_model3
        doc = Nokogiri::HTML(open("https://www.bugatti.com/chiron-sport/"))
      
        info = doc.css("p.MsoNoSpacing").text 
    end

    def self.scrape_model4
        doc = Nokogiri::HTML(open("https://www.bugatti.com/models/chiron-models/chiron-sport-110-ans/"))
      
        info = doc.css("div.text-inner").text 
    end

    def self.scrape_model5
        doc = Nokogiri::HTML(open("https://www.bugatti.com/models/chiron-models/chiron-super-sport-300/"))
      
        info = doc.css("div.text-content-column").text 
    end
end














