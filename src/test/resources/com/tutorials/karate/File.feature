Feature: Test Single User API

  Background: 
    * configure headers = { Accept: 'application/json' }
    * url 'https://reqres.in/api/'

  Scenario: Validate response from file
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And match response == read('response/users_page2.json')

  Scenario: Validate Request Response from file
    Given url 'https://reqres.in/api/users'
    And request read('request/create_user.json')
    When method POST
    Then status 201
    And match response == read('response/create_user.json')
