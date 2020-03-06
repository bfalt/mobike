class AddCategoryToMotorbike < ActiveRecord::Migration[5.2]
  def change
    add_column :motorbikes, :category, :string
    remove_column :motorbikes, :name
  end
end
