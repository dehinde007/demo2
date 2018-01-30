class AddAd2textToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :ad2text, :text
  end
end