require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def menu
    puts "\n"
    puts 'Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit'
  end

  def handle_person_creation(user_input, age, name, parent_permission)
    case user_input
    when '1'
      @people << Student.new(age, name, parent_permission)
      puts 'New student created successfully'
    when '2'
      print 'Enter specialization: '
      specialization = gets.chomp

      @people << Teacher.new(age, specialization, name, parent_permission)
      puts 'New Teacher created successfully'
    else
      puts 'Invalid selection'
    end
  end

  def create_person
    puts "\n"
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '

    user_input = gets.chomp

    print 'Enter Age: '
    age = gets.chomp

    print 'Enter Name: '
    name = gets.chomp

    has_parent_permission = false
    if user_input == '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission_input = gets.chomp

      has_parent_permission = parent_permission_input.include? 'Yy'
    end

    handle_person_creation(user_input, age, name, has_parent_permission)
  end

  def create_book
    puts "\n"
    print 'Enter Book Title: '
    book_title = gets.chomp

    print 'Enter Book Author: '
    book_author = gets.chomp

    @books << Book.new(book_title, book_author)
    puts 'New Book created successfully'
  end

  def create_rental
    puts "\n"
    puts 'Select a book to rent from the numbers in the brackets'
    @books.each_with_index do |book, index|
      puts "(#{index}) - Book Title: #{book.title}, Author: #{book.author}"
    end

    selected_book = gets.chomp.to_i

    puts 'Select a person who is renting the book from the numbers in the brackets'
    @people.each_with_index do |person, index|
      puts "(#{index}) - [#{person.class}] Name: #{person.name}, Age: #{person.age}"
    end

    selected_person = gets.chomp.to_i

    print 'Enter rental date: '
    rental_date = gets.chomp

    @rentals << Rental.new(rental_date, @books[selected_book], @people[selected_person])
    puts 'Book rented successfully'
  end

  def list_all_people
    puts "\n"
    puts 'Note: No people available.' if @people.empty?

    @people.each do |person|
      puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def list_all_books
    puts "\n"
    puts 'Note: No books available.' if @books.empty?

    @books.each do |book|
      puts "Book Title: #{book.title}, Book Author: #{book.author}"
    end
  end

  def list_all_rentals
    puts "\n"

    if @rentals.empty?
      puts 'Note: No rentals available.'
    else
      print 'Enter the ID of the person: '
      input_id = gets.chomp.to_i

      puts 'All Rentals: '
      @rentals.each do |rental|
        if rental.person.id == input_id
          puts "Book Title: #{rental.book.title}, Author: #{rental.book.author}"
          puts "rented on #{rental.date} by #{rental.person.name}"
        else
          puts "User ID #{input_id} not found"
        end
      end
    end
  end

  def handle_menu_selection
    user_input = gets.chomp
    case user_input
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    when '7'
      puts 'Exiting the application...'
      sleep 2
      exit
    end
  end

  def run
    user_input = nil

    puts 'Welcome to the school library'

    while user_input != '7'
      menu
      handle_menu_selection
    end
  end
end

def main
  app = App.new
  app.run
end

main
