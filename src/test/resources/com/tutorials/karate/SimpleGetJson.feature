Feature: Test Single User API

  Background: 
    * configure headers = { Accept: 'application/json' }

  Scenario: Fetch single users
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match $.data contains {id:2}
    And match $.data contains {email:"janet.weaver@reqres.in"}
    And match $.data contains {first_name:"Janet"}

  Scenario: Fetch single users
    Given url 'https://reqres.in/api/users'
    And header userId = 'Abhishek'
    When method GET
    Then status 200
    And match $.data[*].id == [1,2,3,4,5,6]
    And match $.data[*].email == ['george.bluth@reqres.in','janet.weaver@reqres.in','emma.wong@reqres.in','eve.holt@reqres.in','charles.morris@reqres.in','tracey.ramos@reqres.in']
