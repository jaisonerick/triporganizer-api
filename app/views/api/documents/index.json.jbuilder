json.array! @documents do |document|
  json.key document.key
  json.type document.type
  json.title document.title
  json.url document.url
  json.display_type document.display_type
  json.uploadable document.uploadable
  json.trip_id document.trip_id
end
