class Admin::AnalyticsController < Admin::BaseController

  def index
    @user = current_user
    # @categories = Category.highest_priced_item_per_category
    # <% @categories.each do |category, price| %>
    #   <p>Highest priced item for <%= category %>: <%= number_to_currency(price) %></p>
    # <% end %>
    @categories = Category.all
  end

end
