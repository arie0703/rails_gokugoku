class CreateBeercomments < ActiveRecord::Migration[6.0]
  def change
    create_table :beercomments do |t|
      t.string :beercomment
      t.references :user, null: false, foreign_key: true
      t.references :beer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
