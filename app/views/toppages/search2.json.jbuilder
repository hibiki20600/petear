json.array! @messages do |message|
  json.id message.group.id
  json.message message.message
  json.image message.image.url
end