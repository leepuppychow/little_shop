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

  def item_quantity
    contents.values.sum
  end


  def create_order_items(order)
    contents.each do |item_id, quantity|
      order_item = OrderItem.create!(order_id: order.id, item_id: item_id.to_i, original_price: Item.find(item_id.to_s).price, quantity: quantity)
      order_item.update(sub_total: order_item.original_price * order_item.quantity)
    end
  end

end
