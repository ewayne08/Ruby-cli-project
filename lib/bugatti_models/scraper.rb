class BugattiModels::Scraper
  URLS_AND_SELECTORS = [
    ["https://www.bugatti.com/chiron/", "div.text-inner"],
    ["https://www.caranddriver.com/news/a31210941/bugatti-chiron-pur-sport-photos-info/", "p.body-text"],
    ["https://www.bugatti.com/chiron-sport/", "p.MsoNoSpacing"],
    ["https://www.bugatti.com/models/chiron-models/chiron-sport-110-ans/", "div.text-inner"],
    ["https://www.bugatti.com/models/chiron-models/chiron-super-sport-300/", "div.text-content-column"]
  ] 

  def self.scrape_models 
    doc = Nokogiri::HTML(URI.open("https://www.bugatti.com/models/chiron-models/"))
    models = doc.css("figcaption.collage-item-caption")
    
    models.each do |model|
       name = model.text
       BugattiModels::Model.new(name)
    end 
  end 
  
  def self.scrape_info(model, index)
      url, selector = URLS_AND_SELECTORS[index]
      doc = Nokogiri::HTML(URI.open(url))
      
      info = doc.css(selector).text.strip
      model.info = info
  end
end 