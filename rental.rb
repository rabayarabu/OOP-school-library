class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    update_book(book)
    update_person(person)
  end

  def person=(person)
    update_person(person)
  end

  def book=(book)
    update_book(book)
  end

  private

  def update_book(book)
    book.rentals.push(self) unless book.rentals.include?(self)
    @book = book
  end

  def update_person(person)
    person.rentals.push(self) unless person.rentals.include?(self)
    @person = person
  end
end
