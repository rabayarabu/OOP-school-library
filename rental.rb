class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    # Check if person and book are not nil before adding the rental
    book.rentals << self if book
    person.rentals << self if person
  end
end
