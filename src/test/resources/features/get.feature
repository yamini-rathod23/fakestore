Feature: Test GET  endpoints using JSON data

Background:
  * def data = read('classpath:features/testdata.json')
  * def getAllProducts = data.getAllProducts
  * def getProductById3 = data.getProductById3
  * configure headers = { 'User-Agent': 'KarateTestRunner', 'Content-Type': 'application/json' }


@get @getAll
Scenario: Get all products
  Given url getAllProducts
  When method get
  Then status 200

@get @getbyID
Scenario: Get product with ID 3
  Given url getProductById3
  When method get
  Then status 200
  * def productName = response.title
  * karate.log('Product Name:', productName)
