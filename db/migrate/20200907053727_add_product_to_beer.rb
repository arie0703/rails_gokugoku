class AddProductToBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :product, :string
  end
end
