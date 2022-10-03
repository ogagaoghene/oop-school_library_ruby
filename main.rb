#!/usr/bin/env ruby
require_relative 'app'

class Main
  def initialize
    app = Application.new
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

  def prompt
    menu
    choice = gets.chomp.to_i
    options(choice)
    prompt until @choice == 7
  end

  def options(choice)
    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.add_person
    when 4
      app.add_book
    when 5
      app.add_rental
    when 6
      app.list_rentals_by_id
    else
      exit
    end
  end
end

app = Main.new
app.prompt
