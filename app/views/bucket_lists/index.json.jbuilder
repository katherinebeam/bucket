json.array!(@bucket_lists) do |bucket_list|
  json.extract! bucket_list, :id, :title, :description
  json.url bucket_list_url(bucket_list, format: :json)
end
