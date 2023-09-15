require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:date) { '2023-09-15' }
  let(:book) { Book.new('Book Title', 'Author Name') }
  let(:person) { Person.new('20', 'Rahi') }
  let(:rental) { Rental.new(date, book, person) }

  it 'has a date' do
    expect(rental.date).to eq(date)
  end

  it 'has a book' do
    expect(rental.book).to eq(book)
  end

  it 'has a person' do
    expect(rental.person).to eq(person)
  end

  it 'is added to the book rentals' do
    expect(book.rentals).to include(rental)
  end

  it 'is added to the person rentals' do
    expect(person.rentals).to include(rental)
  end
end
