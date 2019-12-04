Feature: Test User API
  Scenario: Fetch all users
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
	And match $ contains {page:2,per_page:6,total_pages:2}
	And match $.data[0] contains {id:7,email:"michael.lawson@reqres.in"} 
	