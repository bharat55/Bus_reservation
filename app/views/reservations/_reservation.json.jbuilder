json.extract! reservation, :id, :bus_id, :user_id, :bus_owner_id, :seats, :date, :time, :from, :to, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
