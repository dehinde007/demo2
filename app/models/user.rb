class User < ActiveRecord::Base   
has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
belongs_to :invitation
 
#user search
  def self.search(search)
    if search 
      where('name LIKE ?', "%#{search}%")
    else
   scoped  
    end
end

 def to_param
   self.username
 end
 


#avatar
  has_attached_file :avatar, styles: {
    mini: '38x38#', 
    thumb: '100x100#'
  }, :url => "/avatars/:id/:style/:basename.:extension",
     :default_url => '/assets/images/avv (4).jpg',
     :path => ":rails_root/public/avatars/:id/:style/:basename.:extension"

validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 

#photo
has_attached_file :photo
    
  has_many :microposts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :likes, dependent: :destroy
   #relationship
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
  

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
