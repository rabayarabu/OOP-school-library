require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'rental'
require_relative 'student'

class App
  attr_accessor :all_books, :all_people, :all_rentals

  def initialize
    @all_books = []
    @all_people = []
    @all_rentals = []
  end

  def books
    @all_books.each_with_index do |book, index|
      puts "#{index}) #{book}"
    end
  end

  def people
    @all_people.each_with_index do |person, index|
      puts "#{index}) #{person}"
    end
  end

  def add_teacher
    puts 'Enter Age'
    age = gets.chomp
    puts 'Enter name'
    name = gets.chomp
    puts 'Enter specialization'
    specialization = gets.chomp
    new_teacher = Teacher.new(age, name)
    new_teacher.specialization = specialization
    @all_people << new_teacher
    puts 'Added Teacher'
  end

  def add_student
    puts 'Enter Age'
    age = gets.chomp
    puts 'Enter name'
    name = gets.chomp
    puts 'Has parent permission[Y/N]'
    perm = gets.chomp.upcase
    permission = (perm == 'Y')
    new_student = Student.new(age, name)
    new_student.parent_permission = permission
    @all_people << new_student
    puts 'Added student'
  end

  def add_person
    puts 'Do you want to create a Student(1) or a Teacher(2). [Input the number]'
    number = gets.chomp.to_i

    case number
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'Input Error: Invalid choice...'
    end
  end

  def add_book
    puts 'Enter book title..'
    title = gets.chomp
    puts 'Enter author name..'
    author = gets.chomp
    new_book = Book.new(title, author)
    @all_books << new_book
    puts 'Book Created Successfully'
  end

  def add_rental
    puts 'Select a person from the list by number (not ID)'
    people
    person_index = gets.chomp.to_i
    puts 'Select a book from the list by number (not ID)'
    books
    book_index = gets.chomp.to_i
    puts 'Enter date'
    date = gets.chomp
    new_rental = Rental.new(date, @all_books[book_index], @all_people[person_index])
    @all_rentals << new_rental
    puts 'Rental Added Successfully'
  end

  def all_personal_rentals(id)
    person_rental = @all_rentals.select do |rental|
      rental.person.id == id
    end
    puts person_rental
  end
end
