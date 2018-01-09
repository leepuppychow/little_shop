class Category < ApplicationRecord
  before_save :generate_slug
  validates :name, presence: true
  has_many :items

  # def self.highest_priced_item_per_category
  #   joins(:items).group(:name).maximum(:price)
  # end

  def highest_priced_item
    max_price = items.maximum(:price)
    items.find_by(price: max_price)
  end

  def number_of_orders_for_each_category

  end
  # def self.number_of_orders_for_each_category
  #   x = find_by_sql("SELECT categories.name, COUNT(order_items.id) FROM order_items
  #           JOIN items ON order_items.item_id = items.id
  #           JOIN categories ON categories.id = items.category_id
  #           GROUP BY categories.name")
  #   binding.pry
  # end


  private

    def generate_slug
      self.slug = name.parameterize
    end

end
