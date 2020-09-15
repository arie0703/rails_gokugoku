class CreateFoodcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :foodcomments do |t|
      t.string :foodcomment
      t.references :user, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
