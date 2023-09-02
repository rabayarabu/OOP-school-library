require_relative 'app'
def show_menu
  puts ''
  puts 'Welcome to School Library App!'
  puts ''
  puts 'Choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
end

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def main
  app = App.new
  loop do
    show_menu
    choice = gets.chomp.to_i
    case choice
    when 1
      app.books
    when 2
      app.people
    when 3
      app.add_person
    when 4
      app.add_book
    when 5
      app.add_rental
    when 6
      puts 'Enter person ID'
      id = gets.chomp.to_i
      app.all_personal_rentals(id)
    when 7
      puts 'GOODBYE'
      break
    else
      puts 'INVALID OPTION'
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

main if __FILE__ == $PROGRAM_NAME
