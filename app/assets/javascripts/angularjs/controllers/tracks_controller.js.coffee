@app.controller "TracksCtrl", [
  "$scope"
  "$state"
  "$stateParams"
  "PointSvc"
  "leafletData"
  ($scope, $state, $stateParams, PointSvc, leafletData) ->
    $scope.paths = {}
    $scope.center = {}
    $scope.markers = {}

    getMap = (startTime,endTime) ->
      PointSvc.getPoints(startTime,endTime).then (result) ->
        leafletData.getMap().then (map) ->
          map.fitBounds [
            [
              result.data.nwlat
              result.data.nwlng
            ]
            [
              result.data.selat
              result.data.selng
            ]
          ]
          return

        angular.extend $scope,
          center:
            lat: 42
            lng: -111
            zoom: 6

          paths:
            p1:
              color: "#008000"
              weight: 4
              latlngs: result.data.path

          markers: result.data.markers

    $scope.updateMap = () ->
      s = Math.round(new Date($scope.startTime).getTime() / 1000)
      e = Math.round(new Date($scope.endTime).getTime() / 1000)
      getMap(s,e)

    today = Math.round(new Date().getTime() / 1000)
    yesterday = today - 86400
    getMap(today,yesterday)
]
