require './rental'
require './book'
require './person'

RSpec.describe Rental do
  context 'Setup Rental class' do
    before :each do
      @person = Person.new(34, name: 'Richard Chambula', parent_permission: false)
      @book = Book.new('Lord of the Rings', 'JRR Tolkiens')
      @rental = Rental.new('23 May 2022', @book, @person)
    end

    it 'returns correct date' do
      expect(@rental.date).to eq('23 May 2022')
    end

    it 'returns correct instance of rentals' do
      expect(@book.rentals[0]).to eq(@rental)
    end

    it 'returns correct rental for person' do
      expect(@person.rentals[0]).to eq(@rental)
    end
  end
end
