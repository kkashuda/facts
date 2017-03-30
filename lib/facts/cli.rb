# Our CLI Controller
class Facts::CLI

  def call
    puts "Hello!"
    puts "Facts are cool, right? Especially when they are surprising."
    puts "Alright so.. here is a list of categories:"
    puts

    self.menu
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
    puts

    self.get_input
  end

  def self.get_input
  end 

end
