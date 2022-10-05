require './student'

describe Student do
  context 'Student class' do
    before(:each) do
      @student = Student.new(22, true)
    end
    it 'should tell the person age and parent permission' do
      expect(@student).to have_attributes(age: 22, parent_permission: true)
    end
  end
end

