class AddImageToHighballs < ActiveRecord::Migration[6.0]
  def change
    add_column :highballs, :image, :string
  end
end
