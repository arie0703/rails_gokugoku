class AddAlcoholToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :alcohol, :string
  end
end
