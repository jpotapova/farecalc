class FareCalculator.StationsCollection extends Backbone.Collection

  url: '/api/stations'
  model: FareCalculator.StationModel

  initialize: ()->
    this.fetch()
