class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || Hash.new(0)
  end

  def count_of(id)
    contents[id.to_s]
  end

  def cart_items
    contents.transform_keys do |key|
      Item.find(key.to_i)
    end
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def total_cost
    cart_items.map {|item, count| item.price * count}.sum
  end

  def remove_item(id)
    contents.delete(id.to_s)
  end

  # def create_order_items(order)
  #   contents.each do |item_id, quantity|
  #     order_item = OrderItem.create(order_id: order.id, item_id: Item.find(params[:item_id]).id, original_price: Item.find(params[:item_id]).price)
  #   end
  # end

end
