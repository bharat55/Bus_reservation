json.extract! bus, :id, :name, :registration_number, :source, :destination, :total_seats, :bus_owners_id, :departure_time, :arrival_time, :created_at, :updated_at
json.url bus_url(bus, format: :json)
