class AddAd3ToMicroposts < ActiveRecord::Migration
  def self.up
    change_table :microposts do |t|

      t.attachment :ad3

    end
  end

  def self.down

    drop_attached_file :microposts, :ad3

  end
end
