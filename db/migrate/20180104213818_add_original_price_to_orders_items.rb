class AddOriginalPriceToOrdersItems < ActiveRecord::Migration[5.1]
  def change
    add_column :orders_items, :original_price, :float
  end
end
