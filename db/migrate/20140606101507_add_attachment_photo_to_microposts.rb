class AddAttachmentPhotoToMicroposts < ActiveRecord::Migration
  def self.up
    change_table :microposts do |t|

      t.attachment :photo

    end
  end

  def self.down

    drop_attached_file :microposts, :photo

  end
end
