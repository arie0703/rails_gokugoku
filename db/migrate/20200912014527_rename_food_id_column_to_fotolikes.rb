class RenameFoodIdColumnToFotolikes < ActiveRecord::Migration[6.0]
  def change
    rename_column :fotolikes, :food_id, :foto_id
  end
end
