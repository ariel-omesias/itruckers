json.extract! appointment, :id, :appointment_date, :status, :user_id, :truck_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
