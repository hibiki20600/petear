json.array! @groups do |group|
  json.id group.id
  json.name group.name
  json.image group.image.url
end