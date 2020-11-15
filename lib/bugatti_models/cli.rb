class BugattiModels::CLI 
  @@muted="\e[1;31m"
  @@grn="\e[1;32m"
  @@blu="\e[1;34m"
  @@mag="\e[1;35m"
  @@cyn="\e[1;36m"
  @@white="\e[0m"
  
  def call 
    puts "\n#{@@cyn}Learn more about Bugatti models!#{@@white}\n\n"
    @input = ""
    until @input == "exit"
      get_models
      list_models
      get_user_model
      what_next
    end 
    goodbye
  end
  
  def get_models
    @models = BugattiModels::Model.all
  end
  
  def list_models
    puts 'Choose a model to see more information:'
    @models.each.with_index(1) do |model, index| 
      puts "#{@@blu}#{index}.#{@@white} #{model.name}"
    end
    puts ""
  end 
  
  def get_user_model
    chosen_model = gets.strip.to_i
    show_info_for(chosen_model) if valid_input(chosen_model, @models)
  end 
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 
  
  def show_info_for(chosen_model)
    index = chosen_model - 1
    model = @models[index]
    model.get_info(model, index)
    puts "#{@@cyn}Here is the info for #{model.name}#{@@white}"
    puts "\n" + model.info
  end
  
  def what_next
    puts "\nAre you done? Type #{@@mag}'exit'#{@@white} to exit or hit any key to learn more about Bugatti models."
    @input = gets.strip
  end 
  
  def goodbye
    puts "\n#{@@grn}Thank you! Enjoy the ride!#{@@white}"
  end 
end

