json.array!(@dia) do |dium|
  json.extract! dium, :id
  json.url dium_url(dium, format: :json)
end
