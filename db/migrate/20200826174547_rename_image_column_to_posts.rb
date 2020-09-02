class RenameImageColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :Image, :image
  end
end
