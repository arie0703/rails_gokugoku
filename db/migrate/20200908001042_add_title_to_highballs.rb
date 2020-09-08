class AddTitleToHighballs < ActiveRecord::Migration[6.0]
  def change
    add_column :highballs, :title, :string
  end
end
