class Micropost < ActiveRecord::Base

  belongs_to :user
  default_scope -> { order('created_at DESC') }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :user_id, presence: true

  #photo
  has_attached_file :photo, styles: {
    thumb: '100x100#',
    normal: '450x425',
    square: '300x300#',
    medium: '550x600'
  }, :url => "/attachments/:id/:style/:basename.:extension",
     :path => ":rails_root/public/attachments/:id/:style/:basename.:extension"
  validates_attachment_presence :photo 
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
   def set_image
    StringIO.open(Base64.decode64(image_json)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "file.jpg"
      data.content_type = "image/jpeg"
      self.image = data
    end
  end

  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
