class RenameTweetsToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_table :tweets, :posts
  end
end
