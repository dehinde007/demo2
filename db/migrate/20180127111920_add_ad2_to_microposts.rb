class AddAd2ToMicroposts < ActiveRecord::Migration
  def self.up
    change_table :microposts do |t|

      t.attachment :ad2

    end
  end

  def self.down

    drop_attached_file :microposts, :ad2

  end
end
