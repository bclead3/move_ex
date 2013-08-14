json.array!(@attributes) do |user_attr|
  json.extract! user_attr, :user_id, :key, :value
  json.url user_attribute_url(user_attr, format: :json)
end
