class AddVerifyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verify, :boolean
  end
end
