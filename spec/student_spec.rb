require './student'

RSpec.describe Student do
  context 'Student class' do
    before(:each) do
      @student = Student.new(22, true)
    end
    it 'takes parametets and returns a Student object' do
      expect(@student).to be_an_instance_of Student
    end
    it 'should tell the person age and parent permission' do
      expect(@student).to have_attributes(age: 22, parent_permission: true)
    end
  end
end

