json.array!(@containers) do |container|
  json.extract! container, 
  json.url container_url(container, format: :json)
end
