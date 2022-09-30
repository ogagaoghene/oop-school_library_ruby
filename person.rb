require_relative 'nameable'

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

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end

  private

  def of_age?
    @age >= 18
  end
end


