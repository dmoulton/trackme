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

    PointSvc.getPoints(1400629955,1401062019).then (result) ->
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


]
