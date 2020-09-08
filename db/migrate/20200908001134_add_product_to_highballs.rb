class AddProductToHighballs < ActiveRecord::Migration[6.0]
  def change
    add_column :highballs, :product, :string
  end
end
