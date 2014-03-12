json.array!(@icpc_entries) do |icpc_entry|
  json.extract! icpc_entry, :id
  json.url icpc_entry_url(icpc_entry, format: :json)
end
