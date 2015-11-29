class CreateVerifies < ActiveRecord::Migration
  def change
    create_table :verifies do |t|
      t.boolean :verified
      t.references :user, index: true

      t.timestamps
    end
  end
end
