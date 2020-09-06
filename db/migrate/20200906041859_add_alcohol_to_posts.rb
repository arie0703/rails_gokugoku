class AddAlcoholToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :alcohol, :string
  end
end
