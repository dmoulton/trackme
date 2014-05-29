@app = angular.module("trackme", ["leaflet-directive","ui.router","ui.bootstrap.datetimepicker"]).config ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state("tracks",
    url: "/"
    templateUrl: "templates/tracks.html"
    controller: "TracksCtrl"
  )
  # if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise "/"
  return
