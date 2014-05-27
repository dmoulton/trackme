@app.factory "PointSvc", ($http) ->
  getPoints: () ->
    $http(
      method: "GET"
      url: "/points.json"
      cache: false
    ).error (data, status, headers, config) ->
      console.log "error " + status
      console.log "error: data " + data
      return
