class AddOriginalPriceToJoinsTableOrdersItems < ActiveRecord::Migration[5.1]
  def change
    add_column :joins_table_orders_items, :original_price, :float
  end
end
