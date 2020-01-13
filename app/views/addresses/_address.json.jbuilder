json.extract! address, :id, :street_name, :street_number, :city, :country, :postal_code, :created_at, :updated_at
json.url address_url(address, format: :json)
