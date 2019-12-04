Feature: Test Single User API

  Background: 
    * configure headers = { Accept: 'application/json' }
    * url 'https://reqres.in/api/'

  Scenario Outline: Fetch single users
    Given url 'https://reqres.in/api/users/<index>'
    When method GET
    Then status 200
    And match $.data contains {id:<id>}
    And match $.data contains {email:'<email>'}
    And match $.data contains {first_name:'<FName>'}

    Examples: 
      | index | id | email                    | FName   |
      |     1 |  1 | george.bluth@reqres.in   | George  |
      |     2 |  2 | janet.weaver@reqres.in   | Janet   |
      |     5 |  5 | charles.morris@reqres.in | Charles |
