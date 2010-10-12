Feature: viewing user music
	As an anonymous user 
	I want to be able to see what people are listening to
	So that I know what I could buy next

	Scenario: viewing the list of users
		Given I am logged out
		And I am on the homepage
		When I follow "view the list of users"
		Then I should see "detlef"
		And I should see "siegfried"

	Scenario: viewing the list of albums for a user
		Given I am logged out
		And I am on the user list page
		When I follow "view siegfried's albums"
		Then I should see "Get A Grip"
		And I should see "Master of Puppets"
		And I should see "The Bends"
		
	Scenario: viewing album details
		Given I am logged out
		And I am on the user list page
		When I follow "view siegfried's albums"
		And I follow "Master of Puppets"
		Then I should not see "add a new track"
		And I should see "add a new comment"
		And I should see "Battery"
		And I should see "Metallica - Master of Puppets (1986)"
