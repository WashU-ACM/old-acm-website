json.array!(@acm_projects) do |acm_project|
  json.extract! acm_project, :id, :name, :description, :owner_id, :status
  json.url acm_project_url(acm_project, format: :json)
end
