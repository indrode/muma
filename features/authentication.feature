Feature: signing up for the application 
	As an anonymous user 
	I want to sign up and log in
	So that I can manage my personal music collection
		
	Scenario: logging in
    Given I am a registered user
    And I am on the homepage
    When I login
    Then I should see "Login successful!"
    And I should see "Log out"

	Scenario: registering a new user
		Given I am logged out
		And I am on the signup page
		When I fill out the signup form
		Then I should be registered

	Scenario: logging out
		Given I am logged in as a user
		When I follow "Log out"
    Then I should see "Logout successful!"
		  
	Scenario: using the authentication links (sign up)
		Given I am logged out
		And I am on the home page
		When I follow "Sign up"
		Then I should be on the sign up page

	Scenario: using the authentication links (login)
		Given I am logged out
		And I am on the home page
		When I follow "log in"
		Then I should be on the login page