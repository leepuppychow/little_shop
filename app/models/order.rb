class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  validates_presence_of :status, :total_price, :created_at, :updated_at

  def item_count
    items.group(:name).count
  end

  def item_subtotals
    items.group(:name).sum(:price)
  end

  def item_count_and_subtotals
    item_count.merge(item_subtotals) do |item, count, subtotal|
      "Quantity: #{count} || Subtotal: $#{'%.2f' % subtotal}"
    end
  end

  def total_item_price
    items.sum(:price)
  end
end
