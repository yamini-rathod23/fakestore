Feature: Update using PUT with updated name

Background:
  * def data = read('classpath:features/testdata.json')
  * def putProduct = data.putProduct3
@put
Scenario: Update object name using PUT request
  Given url putProduct
  And request
  """
{
  
  "title": "Bangles",
  "price": 700,
  "desc": "Gold bangles.",
  "category": "jewelery",
  "image": "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
  "rating": {
    "rate": 4.0,
    "count": 200
  }
}
  """
  When method put
  Then status 200
  And match response.title == 'Bangles'
  * print 'Updated object:', response
