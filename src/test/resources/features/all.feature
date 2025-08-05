@all
Feature: Product CRUD API Testing

Background:
  * def data = read('classpath:features/testdata.json')
  * def baseUrl = data.postProduct

Scenario Outline: Create, Update, and Validate Product Details

  # Step 1 - Create product
  Given url baseUrl
  And request
  """
  {
    "title": "<name>",
    "price": <price>,
    "description": "<description>",
    "image": "https://dummyimage.com/600x400/000/fff&text=<name>",
    "category": "electronics"
  }
  """
  When method post
  Then status 200
  * def objectId = response.id
  * print 'Created ID:', objectId
  * print 'Create Response:', response
  * match response contains { id: '#number' }

  # Step 2 - Get product by ID
  Given url data.getAllProducts + '/' + objectId
  When method get
  Then status 200
  * def originalData = response
  * print 'Fetched Data:', originalData

  # Step 3 - Update the product (using PUT)
  * def updatedData =
  """
  {
    "title": "<name>",
    "price": <price>,
    "description": "<updatedDescription>",
    "image": "https://dummyimage.com/600x400/000/fff&text=<name>",
    "category": "electronics"
  }
  """
  Given url data.getAllProducts + '/' + objectId
  And request updatedData
  When method put
  Then status 200
  * print 'Put Response:', response
  * match response.description == '<updatedDescription>'



Examples:
  | name                                                | price | description                                                                                                                 | updatedDescription                                               |
  | WD 2TB Elements Portable External Hard Drive        | 64    | USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity                                   | Updated: High speed 2TB USB 3.0 external drive                   |
  | SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s | 109   | Easy upgrade for faster boot up, shutdown, application load and response Boosts burst write performance, ideal for workloads | Updated: Faster boot-up with 1TB SSD, great for heavy workloads |
