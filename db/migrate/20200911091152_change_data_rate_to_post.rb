class ChangeDataRateToPost < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :rate, :integer
  end
end
