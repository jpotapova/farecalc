class FareCalculator.IntroView extends Backbone.View

  el: '.main'

  events:
    'click .intro a': 'navigate'

  navigate: (e)->
    e.preventDefault()
    FareCalculator.router.navigate(
      'about'
      {trigger: true}
    )

  template: _.template($('.intro-template').html())

  render: ->
    view = this
    if view.$el.find('.intro').length is 0
      view.$el.fadeOut(()->
        view.$el.html(view.template()).fadeIn()
      )
    this
