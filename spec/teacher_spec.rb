require './teacher'

RSpec.describe Teacher do
  context 'Teacher class' do
    before :each do
      @teacher = Teacher.new(66, 'JavaScript', 'Barry')
    end
    it 'takes parametets and returns a Student object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
    it 'should tell the person age and parent permission' do
      expect(@teacher).to have_attributes(age: 66, specialization: 'JavaScript', name: 'Barry')
    end
  end
end
