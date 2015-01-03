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

        chartsOptions = {
          seriesBarDistance: 1
          axisY:
            labelInterpolationFnc:
              (value)->
                '&pound; ' + value

        }
        chartLabels = ['Annual', 'Monthly', 'Weekly', 'PAYG']
        chartAnimation =
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

        ['yearly', 'monthly', 'weekly'].forEach(
          (chartType)->
            data = {
              labels: chartLabels
              series: [
                [
                  FareCalculator.resultsModel.get('yearlyTC')[chartType]
                  FareCalculator.resultsModel.get('monthlyTC')[chartType]
                  FareCalculator.resultsModel.get('weeklyTC')[chartType]
                  FareCalculator.resultsModel.get('payg')[chartType]
                ]
              ]
            }
            chart = new Chartist.Bar("##{ chartType }-spendings", data, chartsOptions)
            chart.on(
              'draw'
              chartAnimation
            )

        )

        # charts end

        $('html, body').animate(
          {scrollTop: $("#results").offset().top}, 100
          ()->
            resultsBlock.animate({opacity: 1}, 500)
        )
    )
    this
