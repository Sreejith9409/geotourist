json.extract! user, :id, :name, :email, :following_user, :integer, :created_at, :updated_at
json.url user_url(user, format: :json)
