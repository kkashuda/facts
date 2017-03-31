# Our CLI Controller
class Facts::CLI

  def call
    puts "Hello!"
    puts "Facts are cool, right? Especially when they are surprising."
    puts "Alright so.. here is a list of categories:"
    puts

    self.menu
    self.get_input
    self.goodbye
  end

  def menu
    puts "1. Animal Facts"
    puts "2. Famous People and Entertainment Facts"
    puts "3. Finance Facts"
    puts "4. Food and Drink Facts"
    puts "5. Health Facts"
    puts "6. History Facts"
    puts "7. Interesting Facts"
    puts "8. Law Facts"
    puts "9. Nature Facts"
    puts "10. Places Facts"
    puts "11. President Facts"
    puts "12. Science and Technology Facts"
    puts "13. Sports Facts" # lucky number 13!
    puts
    puts "Go ahead and enter 1-13, and a random fact will be generated specifc to the category!"
    puts "If you need to see the list of options again, enter 'list', or if you're ready to exit enter 'exit'."
    puts

    @facts = Facts::TheFacts.list 
  end

  def get_input
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "list"
        self.menu
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
      when "13"
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
