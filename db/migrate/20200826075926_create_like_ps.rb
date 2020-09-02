class CreateLikePs < ActiveRecord::Migration[6.0]
  def change
    create_table :like_ps do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
