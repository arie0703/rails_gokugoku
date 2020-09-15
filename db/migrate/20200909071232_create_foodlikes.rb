class CreateFoodlikes < ActiveRecord::Migration[6.0]
  def change
    create_table :foodlikes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
