class AddBodyToHighballs < ActiveRecord::Migration[6.0]
  def change
    add_column :highballs, :body, :text
  end
end
