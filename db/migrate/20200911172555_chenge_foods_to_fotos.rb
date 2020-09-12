class ChengeFoodsToFotos < ActiveRecord::Migration[6.0]
  def change
    rename_table :foods, :fotos
  end
end
