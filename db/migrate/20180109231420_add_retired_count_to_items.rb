class AddRetiredCountToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :retired_count, :integer, default: 0
  end
end
