require './person'
require './book'
require './rental'

RSpec.describe Person do
  context 'Person class' do
    before(:each) do
      @person = Person.new(22, 'John Sam')
      book = Book.new('Learning how to program Ruby', 'Chris Pine')
      Rental.new('23 May 2022', book, @person)
    end
    it 'takes four parameters and returns a Person object' do
      expect(@person).to be_an_instance_of Person
    end
    it 'should tell the person age and name' do
      expect(@person).to have_attributes(age: 22, name: 'John Sam')
    end
    it 'returns the correct age' do
      expect(@person.age).to eql 22
    end
    it 'returns the correct name' do
      expect(@person.name).to eql 'John Sam'
    end
    it 'To have rented out a book' do
      expect(@person.rentals.length).to eq(1)
    end
  end
end
