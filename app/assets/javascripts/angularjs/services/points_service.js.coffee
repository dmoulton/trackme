@app.factory "PointSvc", ($http) ->
  getPoints: (s,e) ->
    if s? && e?
      url = "/points/#{s}/#{e}/index.json"
    else
      url = "/points.json"

    $http(
      method: "GET"
      url: url
      cache: false
    ).error (data, status, headers, config) ->
      console.log "error " + status
      console.log "error: data " + data
      return
