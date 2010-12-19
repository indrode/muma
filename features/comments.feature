Feature: creating a new artist 
	As a visitor of the webiste
	I want to write comments for albums
	So that everyone can see what I think of their music

	Scenario: adding a comment as anonymous
		Given I am logged out
		And I am on the user list page
		And I follow "view siegfried's albums"
		And I follow "Master of Puppets"
		And I follow "add a new comment"
		When I fill in "Body" with "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
		And I press "Create Comment"
		Then I should see "anonymous wrote"
		And I should see "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
		#And I save and open the page
		
	Scenario: adding a comment
		Given I am logged in as a user
		And I added an artist
		And I added an album
		When I follow "view album details / add tracks"	  
		And I follow "add a new comment"
		And I fill in "Body" with "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
		And I press "Create Comment"
		Then I should see "peter wrote"
		And I should see "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
		
	Scenario: adding an invalid comment
		Given I am logged in as a user
		And I added an artist
		And I added an album
		When I follow "view album details / add tracks"	  
		And I follow "add a new comment"
		And I fill in "Body" with ""
		And I press "Create Comment"
		Then I should see "Invalid Fields"
		And I should see "Diamond Dogs - New Comment"
		
	Scenario: adding a comment with tags
		Given I am logged in as a user
		And I added an artist
		And I added an album
		When I follow "view album details / add tracks"	  
		And I follow "add a new comment"
		And I fill in "Body" with "Lorem \nipsum <b>dolor</b>"
		And I press "Create Comment"
		Then I should see "peter wrote"
		And I should not see "Lorem <br />ipsum <b>dolor</b>"