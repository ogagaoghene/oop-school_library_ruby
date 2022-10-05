require './book'

describe 'Book' do
  context 'Book Class' do
    before :each do
      @book = Book.new('Appreciate Always', 'David Great')
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
  end
end
