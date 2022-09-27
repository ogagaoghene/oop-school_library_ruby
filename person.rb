# Defines the Person class

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    if of_age? && @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end

private