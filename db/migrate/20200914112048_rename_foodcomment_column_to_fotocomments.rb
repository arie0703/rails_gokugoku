class RenameFoodcommentColumnToFotocomments < ActiveRecord::Migration[6.0]
  def change
    rename_column :fotocomments, :foodcomment, :fotocomment
  end
end
