require_relative '../book'

describe Book do
  let(:book) { Book.new('Stranger', 'Rabu') }

  describe '#initialize' do
    it 'creates a new book' do
      expect(book).to be_a(Book)
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the book' do
      expect(book.rentals).to eq([])
    end
  end
end
