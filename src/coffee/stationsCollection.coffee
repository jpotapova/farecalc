class FareCalculator.StationsCollection extends Backbone.Collection

  url: '/api/stations'
  model: FareCalculator.StationModel

  initialize: ()->
    this.fetch()

  match: (namePart)->
    this.filter(
      (station)->
        station.get('name').indexOf(namePart) > -1
    )
