json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nome, :vip
  json.url cliente_url(cliente, format: :json)
end
