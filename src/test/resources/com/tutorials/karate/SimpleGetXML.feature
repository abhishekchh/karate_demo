Feature: Test Single User API

  Background: 
    * configure headers = { Accept: 'text/xml',Content-Type: 'text/xml'}
    * url 'http://www.dneonline.com/calculator.asmx'

  Scenario: Validate soap Service
    Given request
      """
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
       <Add xmlns="http://tempuri.org/">
         <intA>14</intA>
         <intB>2</intB>
       </Add>
      </soap:Body>
      </soap:Envelope>
      """
    When soap action 'http://tempuri.org/Add'
    Then status 200
    And match response ==
      """
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
       <AddResponse xmlns="http://tempuri.org/">
       	<AddResult>16</AddResult>
       	<NotWantedNode> #notpresent </NotWantedNode>
       </AddResponse>
      </soap:Body>
      </soap:Envelope>
      """

  Scenario Outline: Adding two numbers from table
    * def req =
      """
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
       <Add xmlns="http://tempuri.org/">
         <intA></intA>
         <intB></intB>
       </Add>
      </soap:Body>
      </soap:Envelope>
      """
    * set req //intA = '<num1>'
    * set req //intB = '<num2>'
    Given request req
    When soap action 'http://tempuri.org/Add'
    Then status 200
    * def sum = //AddResult
    Then match sum == '<sum>'

    Examples: 
      | num1 | num2 | sum |
      |    2 |    4 |   6 |
      |   12 |    4 |  16 |
      |    5 |   17 |  22 |
      
      

  Scenario: Validate XML based services from file
    Given url 'http://www.dneonline.com/calculator.asmx'
    And request read('request/add.xml')
    When method POST
    Then status 200
    And match response == read('response/add.xml')
