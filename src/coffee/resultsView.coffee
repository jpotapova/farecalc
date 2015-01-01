class FareCalculator.ResultsView extends Backbone.View

  el: '.main'

  template: _.template($('.results-template').html())

  render: ->
    view = this
    resultsBlock = view.$el.find('#results')
    resultsBlock.animate(
      {opacity: 0}
      ()->
        resultsBlock.html(view.template(FareCalculator.resultsModel.attributes))

        # chart begin
        data = {
          labels: ['Annual', 'Monthly', 'Weekly'],
          series: [
            [
              FareCalculator.resultsModel.get('yearlyTC').yearly
              FareCalculator.resultsModel.get('monthlyTC').yearly
              FareCalculator.resultsModel.get('weeklyTC').yearly
            ]
          ]
        }

        options = {
          seriesBarDistance: 1
          axisY:
            labelInterpolationFnc:
              (value)->
                '&pound; ' + value

        }

        chart = new Chartist.Bar('#yearly-spendings', data, options)
        chart.on(
          'draw'
          (data)->
            if data.type is 'bar'
              data.element.animate({
                y2: {
                  begin: 10,
                  dur: 2000,
                  from: data.y2 + 100,
                  to: data.y2,
                  easing: 'easeOutQuart'
                }
              })
        )

        # chart end

        $('html, body').animate(
          {scrollTop: $("#results").offset().top}, 100
          ()->
            resultsBlock.animate({opacity: 1}, 500)
        )
    )
    this
