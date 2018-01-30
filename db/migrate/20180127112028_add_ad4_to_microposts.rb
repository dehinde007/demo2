class AddAd4ToMicroposts < ActiveRecord::Migration
  def self.up
    change_table :microposts do |t|

      t.attachment :ad4

    end
  end

  def self.down

    drop_attached_file :microposts, :ad4

  end
end