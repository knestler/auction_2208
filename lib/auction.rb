class Auction

  attr_reader :items

  def initialize
    @items = []
  end 

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    unpopular = []
    @items.map do |item|
      unpopular << item if item.bids.empty?
    end
    unpopular 
  end

  def potential_revenue
    revenue = []
    @items.each do |item|
    revenue << item.current_high_bid if item.current_high_bid
    end
    revenue.sum
  end

end