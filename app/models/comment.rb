class Comment < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :user
  belongs_to :micropost
  default_scope -> { order('created_at DESC') }
end
