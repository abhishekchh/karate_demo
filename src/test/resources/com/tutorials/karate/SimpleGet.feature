Feature: Test Single User API

  Background: 
    * configure headers = { Accept: 'application/json' }
    * url 'https://reqres.in/api/'

  Scenario: Fetch single users
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match $.data contains {id:2}
    And match $.data contains {email:"janet.weaver@reqres.in"}
    And match $.data contains {first_name:"Janet"}
