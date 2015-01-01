class FareCalculator.AboutView extends Backbone.View

  el: '.main'

  template: _.template($('.about-template').html())

  events:
    'click .about a': 'navigate'

  navigate: (e)->
    e.preventDefault()
    FareCalculator.router.navigate(
      '/'
      {trigger: true}
    )

  render: ->
    view = this
    if view.$el.find('.about').length is 0
      view.$el.fadeOut(()->
        view.$el.html(view.template()).fadeIn()
      )
    this
