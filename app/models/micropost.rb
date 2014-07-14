class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
   has_many :comments
   has_many :likes
  validates :user_id, presence: true
  
  #photo
  has_attached_file :photo, styles: {
    normal: '450x425',
    square: '170x170>',
    thumb: '100x100>',
    medium: '300x300>'
  }
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
