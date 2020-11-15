class BugattiModels::Model
  attr_accessor :name, :info
  @@all = []
   
  def initialize(name)
    @name = name
    @info = []
    save
  end 
 
  def self.all
    BugattiModels::Scraper.scrape_models if @@all.empty?
    @@all
  end
  
  def get_info(model, index)
    BugattiModels::Scraper.scrape_info(model, index) if @info.empty?
  end
  
  def save
    @@all << self
  end
end 