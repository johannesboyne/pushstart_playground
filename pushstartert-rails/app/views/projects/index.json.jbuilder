json.array!(@projects) do |project|
  json.extract! project, :name, :funding_goal, :funded, :state
  json.url project_url(project, format: :json)
end
