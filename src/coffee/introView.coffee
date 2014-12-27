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
    if this.$el.find('.intro').length is 0
      this.$el.append(this.template())    
    this
