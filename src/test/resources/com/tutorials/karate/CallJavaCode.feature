Feature: Test Single User API

  Background: 
    * configure headers = { Accept: 'application/json' }
    * url 'https://reqres.in/api/'
    * def DemoClass = Java.type('com.tutorials.karate.Util')
    * def demoClass = new DemoClass()
    * def index = demoClass.two()
    * def email = demoClass.email()
    * print index, email

  Scenario: Fetch single users
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match $.data contains {id:#(index)}
    And match $.data contains {email:"#(email)"}
    And match $.data contains {first_name:"Janet"}
