require_relative 'rental'
require_relative 'file_reader'
require_relative 'file_writer'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rental.push(rental)
    rental.book = self
  end

  def save_rental(rental)
    @rentals.push(rental)
  end

  def self.save(books)
    data = []
    books.each do |book|
      data << { title: book.title, author: book.author }
    end
    file_writer = FileWriter.new(data, 'books.json')
    file_writer.write
  end

  def self.retrieve
    books = []
    file_reader = FileReader.new('books.json')
    content = file_reader.read
    content.each do |book|
      books << Book.new(book['title'], book['author'])
    end
    books
  end
end
