require 'rails_helper'

describe User, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:username)}
    it {is_expected.to validate_presence_of(:password)}
  end

 describe "Relationships" do
    it "has_many orders" do
      is_expected.to have_many(:orders)
    end
  end
end
