json.extract! client, :id, :name, :id_number, :phone, :email, :address, :created_at, :updated_at
json.url client_url(client, format: :json)