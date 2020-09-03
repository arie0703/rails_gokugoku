class AddMakerToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :maker, :string
  end
end
