
class Item < ApplicationRecord
  validates :description, :price, :status, :image, presence: true
  validates :name, presence: true, uniqueness: true
  validates :image, format: {with: /\.(png|jpg)\Z/i}
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  scope :ordered_by_retired_count, -> {order("retired_count DESC")}
  scope :ordered_by_id, -> {order(:id)}
  before_validation :default_image


  # def validate_image
  #   binding.pry
  #   check_image(self.image)
  # end
  #
  # def check_image(file)
  #   FileMagic.open(:mime) do |fm|
  #     fm.file(file)
  #   end
  # end

  def default_image
    if self.image == ""
      self.image = 'https://orig00.deviantart.net/d878/f/2008/264/4/3/kalin__s_jedi_lightsaber_by_cascador.jpg'
    end
  end
end
