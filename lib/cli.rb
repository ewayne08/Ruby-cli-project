# Command line interface 
# interact with the user and connect our files together 
require_relative "./lib/bugatti_models"

class BugattiModels::CLI   

    def call 
        BugattiModels::Scraper.new.show_models
        puts "Find out about Bugatti models!"
        start
    end

    def start 
        puts ""
        puts "What model would you like to see? 1-5?"
        input = gets.strip.to_i

        print_model(input)

        puts ""
        puts "Would you like to see another model? Enter Y or N"

        input = gets.strip.downcase
        if input == "y"
            start
        elsif input == "n"
            puts "Thank you! I hope you enjoyed!"
            exit
        else
            puts "I don't know what you're asking."
            start
        end
    end
end