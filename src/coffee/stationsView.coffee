class FareCalculator.StationsView extends Backbone.View

  el: '.main'

  template: _.template($('.stations-template').html())

  render: (typed)->
    that = this
    $(this.template()).insertAfter(this.$el.find('#from'))
    FareCalculator.stations.match(typed).forEach(
      (station)->
        (new FareCalculator.StationView({el: that.$el.find('#from').next().find('.dropdown-menu')})).render(station)
    )
    this
