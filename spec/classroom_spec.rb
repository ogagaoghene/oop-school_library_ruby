require './classroom'

RSpec.describe Classroom do
  context 'Setup Classroom class' do
    before :each do
      @classroom = Classroom.new('SLT17')
    end

    it 'returns the correct classname' do
      expect(@classroom.label).to eq('SLT17')
    end
  end
end