class FareCalculator.StationsView extends Backbone.View

  el: '.main'

  events:
    "click .dropdown a": "selectStation"

  selectStation: (e)->
    e.preventDefault()
    $(e.target).closest('.form-group').find('input').val($(e.target).text())

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
    foundStations = FareCalculator.stationsCollection.match(field.val())
    if foundStations.length > 0
      foundStations.forEach(
        (stationModel)->
          subview = new FareCalculator.StationView({
            el: field.next().find('.dropdown-menu')
          })
          that.subViews.push(subview)
          subview.render(stationModel)
      )
    else
      # if FareCalculator.stationNotFound?
      FareCalculator.stationNotFound = new FareCalculator.ErrorMessageModel({
        "name": "Nothing found"
      })
      subview = new FareCalculator.StationView({
        el: field.next().find('.dropdown-menu')
      })
      that.subViews.push(subview)
      subview.render(FareCalculator.stationNotFound)

  render: (field)->
    $(this.template()).insertAfter( field )
    this
