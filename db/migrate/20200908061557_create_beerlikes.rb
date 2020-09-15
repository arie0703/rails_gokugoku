class CreateBeerlikes < ActiveRecord::Migration[6.0]
  def change
    create_table :beerlikes do |t|
      t.references :beer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
