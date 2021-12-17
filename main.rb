require './student'
require './teacher'

class App
  def initialize
    @people = []
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

    puts "\n"
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '

    user_selection = gets.chomp

    print 'Enter Age: '
    age = gets.chomp

    print 'Enter Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission_input = gets.chomp

    has_parent_permission = nil
    if parent_permission_input == 'Y' || parent_permission_input == 'y'
      has_parent_permission = true
    else
      has_parent_permission = false
    end

    case user_selection
    when '1'
      person = Student.new(age, name, has_parent_permission)
      @people << person
      puts 'New student created successfully'
    when '2'
      print 'Enter specialization: '
      specialization = gets.chomp

      person = Teacher.new(age, specialization, name, has_parent_permission)
      @people << person
      puts 'New Teacher created successfully'
    else
      puts 'Invalid selection'
    end
  end

  def list_all_people
    @people.each do |person|
      puts "Name: #{person.name}, Age: #{person.age}"
    end
  end

  def handle_user_input
    user_input = gets.chomp
    case user_input
    when '1'
      puts 'List Books'
    when '2'
      list_all_people
    when '3'
      create_person
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
