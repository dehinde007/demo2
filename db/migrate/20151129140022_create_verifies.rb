class CreateVerifies < ActiveRecord::Migration
  def change
    create_table :verifies do |t|
      t.boolean :verified

      t.timestamps
    end
  end
end
