Feature: Test Single User API

  Background: 
    * configure headers = { Accept: 'application/json' }
    * url 'https://reqres.in/api/'

  Scenario: Passing Response Value into request
    Given path 'users'
    And params { page : '2', per_page :'3' }
    When method GET
    Then status 200
    Then def id = response.data[0].id
    Given path  'users', id
    When method GET
    Then status 200
    And match $.data contains {id:4}
    And match $.data contains {email:"eve.holt@reqres.in"}
    And match $.data contains {first_name:"Eve"}
