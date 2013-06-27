json.array!(@versions) do |version|
  json.extract! version, :item_type, :item_id, :event, :whodunnit, :text, :created_at
  json.url version_url(version, format: :json)
end
