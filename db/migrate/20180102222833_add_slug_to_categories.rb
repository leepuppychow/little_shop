class AddSlugToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :slug, :string, null: false
    add_index :categories, :slug, unique: true
  end
end
