class Item

  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @bidding_closed = false
  end 
  
  def add_bid(attendee, bid)
    @bids[attendee] = bid if @bidding_closed == false
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @bidding_closed = true
  end
end