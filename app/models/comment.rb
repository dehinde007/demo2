class Comment < ActiveRecord::Base
  include PublicActivity::Common
  default_scope -> { order('created_at DESC') }
  belongs_to :user
  belongs_to :micropost
  
end
