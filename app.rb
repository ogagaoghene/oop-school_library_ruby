require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class Application
  attr_accessor :books, :people, :rentals

  def initialize
    @books   = []
    @people  = []
    @rentals = []
  end

  # List all books
  def list_all_books
    if @books.empty?
      puts 'Book list is empty'
    else
      puts 'List of all Books'
      @books.each { |book| puts "Title: #{book.title} Author: #{book.author}" }
    end
  end

  # List all people
  def list_all_people
    if @people.empty?
      puts 'People list is empty, add some people...'
    else
      puts 'List of all People'
      @people.each { |people| puts "[#{people.class}] ID: #{people.id} Name: #{people.name} Age: #{people.age}" }
    end
  end

  # Create a person
  def add_person
    puts 'Creating a Person'
    print 'Do you want to create a student(1) or a teacher(2)? [Enter the number]: '
    choice = gets.chomp.to_i
    case choice
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'Invalid option selected, please select a valid option'
    end
  end

  # Create a student
  def add_student
    print 'Student age: '
    age = gets.chomp.to_i

    print 'Student name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission_input = gets.chomp.downcase
    parent_permission = (parent_permission_input == 'y')

    @people << Student.new(age, name, parent_permission: parent_permission)
    puts "\n \n"
    puts 'Student created successfully!!!'
    puts "\n \n"
  end

  # Create a teacher
  def add_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)
    puts "\n \n"
    puts 'Teacher created successfully!!!'
    puts "\n \n"
  end

  # Create a book
  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "#{title} by #{author} created successfully!!!"
  end

  # Create a rental
  def add_rental
    puts "\n"
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts "\n"
    print 'Select the person from the list above [input number]:'

    selected_person = gets.chomp.to_i
    person = @people[selected_person]

    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title},  Author: #{book.author}"
    end
    print 'Select the book from the list above [input number]:'
    selected_book = gets.chomp.to_i
    book = @books[selected_book]

    print 'Date: '
    date = gets.chomp

    new_rental = Rental.new(date, person, book)
    @rentals << new_rental

    puts "Rental successfully created !!! \n \n"
  end

  # List rentals for a given person by ID
  def list_rentals_by_id
    puts "\n \n"
    if @people.length
      @people.each do |person|
        puts "[#{person.class.name}] - ID: #{person.id}, Name: #{person.name}, Age: (#{person.age})"
      end
    else
      puts 'No people to display'
    end
    puts "\n \n"
    print 'Enter Person ID: '
    person_id = gets.chomp.to_i
    person = @rentals.select { |p| p.person.id == person_id }
    # rentals = person.rentals
    person.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}" }
  end
end
