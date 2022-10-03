#!/usr/bin/env ruby
require_relative 'app'

class Main
  def initialize
    @app = Application.new
  end

  def menu
    puts 'Welcome to the School library Application!!'
    puts "
    Please choose an option from the list by entering a number:\n
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals by ID for a given person
    7 - Exit"
  end

  def options(value)
    case value
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      add_person
    when 4
      add_book
    when 5
      add_rental
    when 6
      list_rentals_by_id
    else
      exit
    end
  end

  def prompt
    menu
    @choice = gets.chomp.to_i
    options(@choice)
    menu until @choice == 7
  end
end

app = Main.new
app.prompt


