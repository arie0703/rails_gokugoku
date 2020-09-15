class CreateHighcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :highcomments do |t|
      t.string :highcomment
      t.references :user, null: false, foreign_key: true
      t.references :highball, null: false, foreign_key: true

      t.timestamps
    end
  end
end
