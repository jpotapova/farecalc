class FareCalculator.StationsCollection extends Backbone.Collection

  url: '/api/stations'
  model: FareCalculator.StationModel

  initialize: ()->
    this.fetch()

  match: (namePart)->
    namePart = namePart.toLowerCase()
    this.filter(
      (station)->
        station.get('name').toLowerCase().indexOf(namePart) > -1
    )
