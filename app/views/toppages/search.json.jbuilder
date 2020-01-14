json.array! @users do |user|
  json.id user.id
  json.image user.image.url
  json.name user.name
end
