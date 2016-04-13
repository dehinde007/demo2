class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :peer
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps null: false
    end
  end
end
