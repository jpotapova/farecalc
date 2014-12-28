class FareCalculator.FormView extends Backbone.View

  el: '.main'

  events:
    'submit .journey-form': 'submit'
    'keyup #from': 'suggestStations'
    'keyup #to': 'suggestStations'

  template: _.template($('.journey-form-template').html())

  submit: (e)->
    e.preventDefault()
    FareCalculator.router.navigate(
      'results'
      {trigger: true}
    )

  suggestStations: (e)->
    if not FareCalculator.fromStations?
      console.log 'no list'
      FareCalculator.fromStations = new FareCalculator.StationsView
      FareCalculator.fromStations.render($(e.target))
    else
      console.log 'got list'
    FareCalculator.fromStations.update($(e.target))

  render: ->
    if this.$el.find('.journey-form').length is 0
       this.$el.append(this.template())
    this
