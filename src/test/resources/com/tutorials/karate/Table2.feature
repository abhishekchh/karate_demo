@ignore
Feature: Table

  Background: 
    * configure headers = { Accept: 'application/json' }
    * url 'https://reqres.in/api/'

  Scenario: 
    Given path 'users'
    And request { name: '#(Fname)', job: '#(job)'}
    When method post
    Then status 201
    #And match response == { name: #(Fname), job: #(job), "id": #string, "createdAt": #present }
    And match response == read('response/create_user_dynamic.json')
