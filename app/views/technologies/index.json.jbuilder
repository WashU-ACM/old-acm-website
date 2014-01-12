json.array!(@technologies) do |technology|
  json.extract! technology, :id
  json.url technology_url(technology, format: :json)
end
