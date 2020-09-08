class AddUserIdToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :user_id, :integer
  end
end
