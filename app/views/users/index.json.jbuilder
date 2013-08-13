json.array!(@users) do |user|
  json.extract! user, :name, :email, :address, :user_attributes
  json.url user_url(user, format: :json)
end
