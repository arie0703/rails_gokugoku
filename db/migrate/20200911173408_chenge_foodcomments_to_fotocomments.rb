class ChengeFoodcommentsToFotocomments < ActiveRecord::Migration[6.0]
  def change
    rename_table :foodcomments, :fotocomments
  end
end
