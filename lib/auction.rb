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

  def bidders
   bidders = []
    items.each do |item|
      item.bids.each do |bidder, item|
        bidders << bidder.name
      end
    end 
    bidders.uniq
  end

  def bidder_info
    info = Hash.new {|h,k| h[k] = {budget: 0, items: []}}
    @items.each do |item|
      item.bids.each do |bidder, amount|
        info[bidder][:budget] = bidder.budget
        info[bidder][:items] << item
      end
    end
    info
  end
end