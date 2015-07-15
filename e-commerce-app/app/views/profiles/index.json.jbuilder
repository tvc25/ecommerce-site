json.array!(@profiles) do |profile|
  json.extract! profile, :id, :email, :user_id, :twitter, :facebook
  json.url profile_url(profile, format: :json)
end
