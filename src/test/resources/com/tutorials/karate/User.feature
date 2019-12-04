Feature: Test Single User API

Background: 
	* configure headers = { Accept: 'application/json' }
	* url 'https://reqres.in/api/'
#	* configure ssl = true
  
#  Scenario: Fetch single users
#    Given url 'https://reqres.in/api/users/2'
#    When method GET
#    Then status 200
#	And match $.data contains {id:2}
#	And match $.data contains {email:"janet.weaver@reqres.in"}
#	And match $.data contains {first_name:"Janet"}
#	
#  Scenario: Validate response from file
#    Given url 'https://reqres.in/api/users?page=2'
#    When method GET
#    Then status 200
#	And match response == read('response/users_page2.json')
#
  Scenario: Validate Request Response from file
    Given url 'https://reqres.in/api/users'
    And request read('request/create_user.json')
    When method POST
    Then status 201
	And match response == read('response/create_user.json')
	
	
  Scenario: Validate Request Response from file
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

	 