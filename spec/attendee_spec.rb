require './lib/item'
require './lib/attendee'

RSpec.describe Attendee do
  
  before :each do

    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
  end

 it 'exitst' do 
    expect(@attendee1).to be_an_instance_of(Attendee)
  end 

  it 'has attributes' do
    expect(@attendee1.name).to eq("Megan")
    expect(@attendee1.budget).to eq(50)
  end

end