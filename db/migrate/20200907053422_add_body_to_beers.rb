class AddBodyToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :body, :text
  end
end
