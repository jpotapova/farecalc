class FareCalculator.StationView extends Backbone.View

  template: _.template($('.station-template').html())

  render: (station)->
    this.$el.append(this.template(station.attributes))
    this
