class Category < ApplicationRecord
  before_save :generate_slug
  validates :name, presence: true
  has_many :items


  private

    def generate_slug
      self.slug = name.parameterize
    end

end
