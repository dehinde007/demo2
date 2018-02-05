class Micropost < ActiveRecord::Base
include PublicActivity::Common
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :trends, dependent: :destroy
  validates :user_id, presence: true

#Ads
has_attached_file :ad1, styles: { 
    thumb: '100x100>'
  }, :url => "/Ad1/:id/:style/:basename.:extension",
     :path => ":rails_root/public/Ad1/:id/:style/:basename.:extension"
validates_attachment_content_type :ad1, :content_type => /\Aimage\/.*\Z/ 

has_attached_file :ad2, styles: { 
    thumb: '100x100>'
  }, :url => "/Ad2/:id/:style/:basename.:extension",
     :path => ":rails_root/public/Ad2/:id/:style/:basename.:extension"
validates_attachment_content_type :ad2, :content_type => /\Aimage\/.*\Z/

has_attached_file :ad3, styles: { 
    thumb: '100x100#'
  }, :url => "/Ad3/:id/:style/:basename.:extension",
     :path => ":rails_root/public/Ad3/:id/:style/:basename.:extension"
validates_attachment_content_type :ad3, :content_type => /\Aimage\/.*\Z/

has_attached_file :ad4, styles: { 
    thumb: '100x100#'
  }, :url => "/Ad4/:id/:style/:basename.:extension",
     :path => ":rails_root/public/Ad4/:id/:style/:basename.:extension"
validates_attachment_content_type :ad4, :content_type => /\Aimage\/.*\Z/

  #photo
  has_attached_file :photo, styles: {
    instag: ['1080x1080', :jpg],
    square: ['300x300#', :jpg]
  }, 
    :convert_options => {
    :instag => "-interlace Plane",
    :square => "-interlace Plane"
  },
    :url => "/attachments/:id/:style/:basename.:extension",
    :path => ":rails_root/public/attachments/:id/:style/:basename.:extension"
  validates_attachment_presence :photo 
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
