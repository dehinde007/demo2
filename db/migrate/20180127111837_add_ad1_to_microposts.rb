class AddAd1ToMicroposts < ActiveRecord::Migration
  def self.up
    change_table :microposts do |t|

      t.attachment :ad1

    end
  end

  def self.down

    drop_attached_file :microposts, :ad1

  end
end
