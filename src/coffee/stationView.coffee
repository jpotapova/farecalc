class FareCalculator.StationView extends Backbone.View

  template: _.template($('.station-template').html())



  render: (stationModel)->
    this.$el.append(this.template(stationModel.attributes))
    this

  
