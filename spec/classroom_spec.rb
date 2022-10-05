require './classroom'
require './student'

RSpec.describe Classroom do
  context 'Setup Classroom class' do
    before :each do
      @student = Student.new(14, parent_permission: false)
      @classroom = Classroom.new('SLT17')
    end

    it 'returns the correct classname' do
      expect(@classroom.label).to eq('SLT17')
    end
    it 'has students' do
      @classroom.add_student(@student)
      expect(@classroom.students.length).to eq(1)
    end
  end
end
