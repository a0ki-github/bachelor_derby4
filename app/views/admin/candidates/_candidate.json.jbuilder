json.extract! candidate, :id, :name, :age, :title, :youtube_url, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
