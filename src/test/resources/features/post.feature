Feature: To create a new object via POST request

Background:
  * def data = read('classpath:features/testdata.json')
  * def postProduct = data.postProduct
  * configure headers = { 'User-Agent': 'KarateTestRunner', 'Content-Type': 'application/json' }


@post
Scenario: create new record
  Given url postProduct
  And request
  """
  {
    "id": 5,
    "title": "Naga Dragon Bracelet",
    "price": 695,
    "desc": "Gold & silver piece symbolizing love and protection.",
    "category": "jewelery",
    "image": "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "rating": {
      "rate": 4.6,
      "count": 400
    }
  }
  """
  When method post
  Then status 201
  And match response.title == 'Naga Dragon Bracelet'
  And match response.id == '#number'
  * def objectId = response.id
  * print 'Created Object ID:', objectId
