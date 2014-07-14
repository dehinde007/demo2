json.array!(@likes) do |like|
  json.extract! like, :micropost_id, :user_id, :heart
  json.url like_url(like, format: :json)
end