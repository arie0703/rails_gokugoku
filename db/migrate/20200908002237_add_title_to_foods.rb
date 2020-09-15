class AddTitleToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :title, :string
  end
end
