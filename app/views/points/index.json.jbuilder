json.path do
    json.array!(@points) do |point|
      json.extract! point, :lat, :lng
    end
end

json.markers do
  @points.each do |point|
    json.set! point.id do
      json.(point, :lat, :lng)
      json.message "Speed: #{(point.speed/1000*0.621371*60*60).round(1)} mph<br />Bearing: #{point.bearing}&deg;<br /> Time: #{point.timestamp}"
    end
  end
end

json.nwlat @highlat
json.nwlng @lowlng
json.selat @lowlat
json.selng @highlng
