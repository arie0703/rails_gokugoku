class AddTitleToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :title, :string
  end
end
