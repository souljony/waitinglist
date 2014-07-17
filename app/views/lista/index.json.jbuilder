json.array!(@lista) do |listum|
  json.extract! listum, :id, :nome, :pax, :sentado, :sentado_em
  json.url listum_url(listum, format: :json)
end
