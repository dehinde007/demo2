class Trend < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  
end
