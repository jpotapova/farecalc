#casper.options.clientScripts.push("../../dist/js/libs/jquery.min.js")
#casper.options.clientScripts.push("../../dist/js/main.js")

casper.test.begin(
  "Hello, Test 2!"
  (test) ->
    test.assert(FareCalculator is not undefined)
    test.done()
)
