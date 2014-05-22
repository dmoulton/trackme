json.array!(@points) do |point|
  json.extract! point, :id, :lat, :lon, :timestamp, :hdop, :altitude, :speed, :bearing, :profile_id, :user_id
  json.url point_url(point, format: :json)
end
