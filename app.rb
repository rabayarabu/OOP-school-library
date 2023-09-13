require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require 'json'
require_relative 'rental'


class App
  def initialize
    @all_books = []
    @all_people = []
    @all_rentals = []
    load_data
  end

  def books
    @all_books.each_with_index do |book, index|
      puts "#{index + 1}) #{book}"
    end
  end

  def people
    @all_people.each_with_index do |person, index|
      puts "#{index + 1}) #{person}"
    end
  end

  # create person
  def create_person(user_type)
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp

    case user_type
    when '1'
      create_student(age, name)
    when '2'
      create_teacher(age, name)
    else
      puts 'Invalid choice'
    end
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission = %w[Y y].include?(permission)

    student = Student.new(age, name, parent_permission: permission)
    @persons << student
    puts 'Student created successfully'
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
    puts 'Teacher created successfully'
  end

  # list all person
  def list_persons
    @persons.each do |person|
      display_person(person)
    end
  end

  # create book
  def create_book(title, author)
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  # list all book
  def list_books
    @books.each do |book|
      display_books(book)
    end
  end

  def create_rental(date, book_index, person_index)
    @rentals << Rental.new(date, @books[book_index], @persons[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_by_person(person_id)
    person = @persons.find { |p| p.id == person_id }
    rentals = @rentals.select { |r| r.person == person }
    puts 'Rentals'
    rentals.each do |r|
      puts "Date: #{r.date}, Book: \"#{r.book.title}\" by #{r.book.author}"
    end
  end

  def display_person(person)
    puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  def display_books(book)
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end

  def save_data
    File.write('books.json', JSON.generate(@all_books))
    File.write('./people.json', JSON.generate(@all_people))
    File.write('rentals.json', JSON.generate(@all_rentals))
    puts 'Data saved successfully.'
  end

  def load_data
    @all_books = JSON.parse(File.read('books.json')) if File.exist?('books.json')
    @all_people = JSON.parse(File.read('people.json')) if File.exist?('people.json')
    @all_rentals = JSON.parse(File.read('rentals.json')) if File.exist?('rentals.json')
    puts 'Data loaded successfully.'
  end
end
