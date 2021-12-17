class App
  def initialize
    
  end

  def menu
    puts 'Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit'
  end

  def handle_user_input
    user_input = gets.chomp
    case user_input
    when '1'
      puts 'List Books'
    when '2'
      puts 'List People'
    when '3'
      puts 'Create Person'
    when '4'
      puts 'Create a book'
    when '5'
      puts 'Create a rental'
    when '6'
      puts 'List all'
    when '7'
      exit
    end
  end

  def run
    user_input = nil

    puts 'Welcome to the school library'

    while user_input != '7'
      menu
      handle_user_input
    end
  end
end

def main
  app = App.new
  app.run
end

main
