#!/usr/bin/env ruby
require_relative 'app'

def main
  app = Application.new 
  app.run()
end 

def menu_options(ivalue)
  if ivalue == 1
    list_all_books
  elsif ivalue == 2
    list_all_people
  elsif ivalue == 3
    add_person 
  elsif ivalue == 4
    add_book
  elsif ivalue == 5
    add_rental
  elsif ivalue == 6
    list_rentals_by_id
  else 
    exit
  end
end 

def menu
  $stdout.sync = true
  puts "Welcome to the School library Application!!"
  print "Enter your name: "
  name = gets.chomp()
  puts "
  Welcome, #{name.capitalize}. Please choose an option from the list by entering a number:\n
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals by ID for a given person 
  7 - Exit"

  choice = gets.chomp().to_i
  menu_options(choice)
  menu()
end 

main()



