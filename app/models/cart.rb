class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || Hash.new(0)
  end

  def cart_items
    contents.transform_keys do |key|
      Item.find(key.to_i)
    end
  end

  def add_item(id)
    contents[id.to_s] += 1
  end

  def total_cost
    cart_items.map {|item, count| item.price * count}.sum
  end

end
