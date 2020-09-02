class ChangeLikePsToLikes < ActiveRecord::Migration[6.0]
  def change
    rename_table :like_ps, :likes
  end
end
