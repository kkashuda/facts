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
      input = self.to_int_or_string(gets.strip)
      case input
      when "list"
        self.menu
      when "exit"
        self.goodbye
      when (0..12)
        # the input corresponds to the index of the links array in TheFacts
        Facts::TheFacts.index(input)
      else
        puts "Type 'list' if you need to see the options again, or 'exit' to exit the program."
      end
    end
  end

  # thank you stackoverflow
  def to_int_or_string(str)
    return str.match(/^-?\d+$/) ? str.to_i : str.strip
  end

  def goodbye
    puts
    puts "Thanks for hanging out! Hope you learned something new, and interesting! :)"
  end
end # end of CLI class
