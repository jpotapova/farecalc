class FareCalculator.StationsView extends Backbone.View

  el: '.main'

  template: _.template($('.stations-template').html())

  subViews: []

  removeStations: (field)->
    ###
    this.subViews.forEach(
      (subView)->
        subView.remove()
    )
    ###
    field.next().find('.dropdown-menu').html('')
    this.subViews = []

  update: (field)->
    that = this
    this.removeStations(field)
    FareCalculator.stations.match(field.val()).forEach(
      (station)->
        subview = new FareCalculator.StationView({
          el: field.next().find('.dropdown-menu')
        })
        that.subViews.push(subview)
        subview.render(station)
    )

  render: (field)->
    $(this.template()).insertAfter( field )
    this
