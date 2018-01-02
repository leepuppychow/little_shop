require 'rails_helper'

describe Category, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:items)}
  end

end
