class Category < ApplicationRecord
  before_save :generate_slug
  validates :name, presence: true
  has_many :items

  def self.highest_priced_item_per_category
    joins(:items).group(:name).maximum(:price)
    # binding.pry
  end

  def number_of_orders_for_each_category

  end


  private

    def generate_slug
      self.slug = name.parameterize
    end

end
