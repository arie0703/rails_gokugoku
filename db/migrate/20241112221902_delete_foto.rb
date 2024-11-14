class DeleteFoto < ActiveRecord::Migration[7.2]
  def change
    drop_table :fotos, force: :cascade
    drop_table :fotocomments, force: :cascade
    drop_table :fotolikes, force: :cascade
  end
end
