class AddMakerToHighballs < ActiveRecord::Migration[6.0]
  def change
    add_column :highballs, :maker, :string
  end
end
