json.extract! contact_detail, :id, :first_name, :last_name, :description, :telephone, :mobile, :user_id, :created_at, :updated_at
json.url contact_detail_url(contact_detail, format: :json)
