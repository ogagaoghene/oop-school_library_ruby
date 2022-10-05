require './rental'

describe 'Rental' do
    it 'Checks rental class' do
     date = '4/12/22'
     book = Book.new('Coleman Texas', 'Emotional Inteligence')
     person = Person.new(24, 'David Awesome')
     rental = Rental.new(date, book, person)
     expect(rental.book.title) to eql 'Emotional inteligence'
     expect(rental.book.author) to eql 'Coleman Texas'
     expect(rental.person.age) to eql 24
     expect(rental.person.name) to eql 'David Awesome'
     expect(rental.date) to eql '4/12/22'
    end
end

