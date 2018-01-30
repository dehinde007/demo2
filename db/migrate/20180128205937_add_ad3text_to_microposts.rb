class AddAd3textToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :ad3text, :text
  end
end