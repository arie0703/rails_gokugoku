class RenameFoodIdColumnToFotocomments < ActiveRecord::Migration[6.0]
  def change
    rename_column :fotocomments, :food_id, :foto_id
  end
end
