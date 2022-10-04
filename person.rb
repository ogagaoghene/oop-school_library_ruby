require_relative 'nameable'
require_relative 'rental'
require_relative 'file_reader'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def initialize(age, name, parent_permission: true)
    super()
    @id = id || Random.rand(1..1000).to_s
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rentals(date, book)
    rental = Rental.new(date, self, book)
    rentals.push(rental)
  end

  def self.save(people)
    data = []
    people.each do |person|
      case person.class.to_s
      when 'Student'
        data << { id: person.id, name: person.name, age: person.age, type: person.class,
                  parent_permission: person.parent_permission }
      when 'Teacher'
        data << { id: person.id, name: person.name, age: person.age, type: person.class,
                  specialization: person.specialization }
      end
    end
    file_writer = FileWriter.new(data, 'people.json')
    file_writer.write
  end

  def self.retrieve
    people = []
    file_reader = FileReader.new('people.json')
    content = file_reader.read
    content.each do |person|
      case person['type']
      when 'Student'
        people << Student.new(person['age'], person['id'], person['name'],
                              parent_permission: person['parent_permission'])
      when 'Teacher'
        people << Teacher.new(person['age'], person['specialization'], person['id'], person['name'])
      end
    end

    people
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
