@patch
Feature: Add new field using PATCH req

Background:
  * def data = read('classpath:features/testdata.json')
  * def patchProduct = data.patchProduct3
  * configure headers = { 'User-Agent': 'KarateTestRunner', 'Content-Type': 'application/json' }


Scenario: Add year to existing object
  Given url patchProduct
  And request
  """
{
   "desc": "Gold and silver bangles."
}

  """
  When method patch
  Then status 200



