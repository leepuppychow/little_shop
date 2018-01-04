class AddAddressToJoinsTableOrdersItems < ActiveRecord::Migration[5.1]
  def change
    add_column :joins_table_orders_items, :address, :string
  end
end
