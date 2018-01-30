class AddAd1textToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :ad1text, :text
  end
end