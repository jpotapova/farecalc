class FareCalculator.ResultsView extends Backbone.View

  el: '.main'

  template: _.template($('.results-template').html())

  render: ->
    view = this
    resultsBlock = view.$el.find('#results')
    resultsBlock.animate(
      {opacity: 0}
      ()->
        resultsBlock.html(view.template())
        $('html, body').animate(
          {scrollTop: $("#results").offset().top}, 100
          ()->
            resultsBlock.animate({opacity: 1}, 500)
        )
    )
    this
