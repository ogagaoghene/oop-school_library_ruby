require './book'
require './rental'
require './student'

RSpec.describe 'Book' do
  context 'Book Class' do
    before :each do
      @book = Book.new('Appreciate Always', 'David Great')
      student = Student.new(34, parent_permission: false)
      Rental.new('23 May 2022', @book, student)
     end
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
    it 'returns the correct title' do
      expect(@book.title).to eql 'Appreciate Always'
    end
    it 'returns the correct author' do
      expect(@book.author).to eql 'David Great'
    end
    it 'It is rented out' do
      expect(@book.rentals.length).to eq(1)
    end
  end
end
