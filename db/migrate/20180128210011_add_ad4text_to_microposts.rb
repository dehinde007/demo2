class AddAd4textToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :ad4text, :text
  end
end