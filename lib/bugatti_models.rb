require_relative "./bugatti_models/version"
require_relative "./bugatti_models/cli"
require_relative "./bugatti_models/model"
require_relative "./bugatti_models/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'

module BugattiModels
  class Error < StandardError; end
  # Your code goes here...
end
