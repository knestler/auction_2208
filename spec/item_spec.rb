require './lib/item'

RSpec.describe Item do
  
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
  end 

  it 'exitst' do 
    expect(@item1).to be_an_instance_of(Item)
    expect(@item2).to be_an_instance_of(Item)
  end 

  it 'has attributes' do
    expect(@item1.name).to eq("Chalkware Piggy Bank")
  end

  it 'can add items and bids' do 
    expect(@item1.bids).to eq({})

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})

    expect(@item1.current_high_bid).to eq(22)
  end

  it 'can close bidding' do
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
   
    expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})

    @item1.close_bidding
    @item1.add_bid(@attendee3, 70)
    @item1.add_bid(@attendee2, 120)

    expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
  end

end