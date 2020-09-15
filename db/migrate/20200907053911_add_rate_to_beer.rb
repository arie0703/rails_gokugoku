class AddRateToBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :rate, :integer
  end
end
