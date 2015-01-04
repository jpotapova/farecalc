url = 'http://test.farecalculator.co.uk/'

# ------------------------------------------------------------------------------

casper.test.begin('Form', {

  setUp: (test) ->
    # open site
    casper.start url

  test: (test) ->

    casper.then(
      () ->
        test.assertDoesntExist '.journey-form'
        
        casper.waitForSelector('.journey-form'
          ()->
             this.sendKeys("#from", "ng", { keepFocus: true });
             casper.waitForSelector('.dropdown.stations'
              ()->
                test.assertElementCount('.dropdown.stations li', 2)
                casper.click('.dropdown.stations li:first-child a')
                test.assert( casper.getFormValues('form').from is "Angel" )
             )
        )
    )

    casper.run(
      () ->
        test.done()
    )
})
