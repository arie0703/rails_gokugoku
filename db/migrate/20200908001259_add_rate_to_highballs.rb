class AddRateToHighballs < ActiveRecord::Migration[6.0]
  def change
    add_column :highballs, :rate, :integer
  end
end
