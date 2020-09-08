class AddUserIdToHighballs < ActiveRecord::Migration[6.0]
  def change
    add_column :highballs, :user_id, :integer
  end
end
