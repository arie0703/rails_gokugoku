class AddBodyToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :body, :text
  end
end
