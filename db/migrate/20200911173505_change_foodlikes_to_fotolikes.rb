class ChangeFoodlikesToFotolikes < ActiveRecord::Migration[6.0]
  def change
    rename_table :foodlikes, :fotolikes
  end
end
