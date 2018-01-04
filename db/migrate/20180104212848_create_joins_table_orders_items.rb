class CreateJoinsTableOrdersItems < ActiveRecord::Migration[5.1]
  def change
    create_table :joins_table_orders_items do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
    end
  end
end
