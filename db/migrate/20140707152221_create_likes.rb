class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :micropost_id
      t.integer :user_id
      t.boolean :heart

      t.timestamps
    end
  end
end
