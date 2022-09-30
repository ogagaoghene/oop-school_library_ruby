#!/usr/bin/env ruby
require_relative 'app'

def main
  app = Application.new
  app.run
end

def menu_options(ivalue)
  case ivalue
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

def menu
  $stdout.sync = true
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

  choice = gets.chomp.to_i
  menu_options(choice)
  menu
end

main
