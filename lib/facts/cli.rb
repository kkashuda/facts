# Our CLI Controller
class Facts::CLI
  $started = false
  def call
    puts "Hello!"
    puts "Facts are cool, right? Especially when they are surprising."
    puts "Alright so.. here is a list of categories:"
    puts

    self.menu
    self.get_input

    # not leaving this here
    Facts::TheFacts.scrape_links
  end

  def menu
    @categories = Facts::TheFacts.scrape_categories
    index = 0
    @categories.each do  |category|
      puts "#{index} - #{category}"
      index += 1
    end

    if $started == false
      puts "Go ahead and enter 0-12, and a random fact will be generated specifc to the category!"
      puts "If you need to see the list of options again, enter 'list', or if you're ready to exit enter 'exit'."
      puts

      $started = true
    end

  end

  def get_input
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "list"
        self.menu
      when "exit"
        self.goodbye
      when "0"
        puts
      when "1"
      when "2"
      when "3"
      when "4"
      when "5"
      when "6"
      when "7"
      when "8"
      when "9"
      when "10"
      when "11"
      when "12"
      else
        puts "Type 'list' if you need to see the options again, or 'exit' to exit the program."
      end
    end
  end

  def goodbye
    puts
    puts "Thanks for hanging out! Hope you learned something new, and interesting! :)"
  end
end # end of CLI class
