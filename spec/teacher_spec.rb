require './teacher'

RSpec.describe Teacher do
  it 'Teacher class' do
    teacher = Teacher.new(66, 'JavaScript', 'Barry')
    expect(teacher).to have_attributes(age: 66, specialization: 'JavaScript', name: 'Barry')
  end
end
