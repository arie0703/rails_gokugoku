class CreateHighballs < ActiveRecord::Migration[6.0]
  def change
    create_table :highballs do |t|

      t.timestamps
    end
  end
end
