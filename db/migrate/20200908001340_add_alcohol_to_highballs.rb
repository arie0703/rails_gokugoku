class AddAlcoholToHighballs < ActiveRecord::Migration[6.0]
  def change
    add_column :highballs, :alcohol, :string
  end
end
