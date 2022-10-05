require './person'


describe Person do
  context 'Person class' do
    before(:each) do
      @person = Person.new(22, 'John Sam')
    end
    it 'should tell the person age and parent permission' do
      expect(@person).to have_attributes(age: 22, name: 'John Sam')
    end
  end
end
