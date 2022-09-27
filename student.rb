require 'person'

# Defines the Student class
class Student < Person
  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
