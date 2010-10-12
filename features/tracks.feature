Feature: adding tracks to an album 
	As an authenticated user 
	I want to add albums tracks
	So more valuable information is added to my music collection
	
	Scenario: adding album tracks
		Given I am logged in as a user
		And I added an artist
		And I added an album
		When I follow "view album details / add tracks"	  
		And I follow "add a new track"
		And I fill in "Title" with "Future Legend"
		And I fill in "Tracknumber" with "1"
		And I press "Create Track"
		Then I should see "Future Legend" within "td"
	
	Scenario: adding invalid tracks
		Given I am logged in as a user
		And I added an artist
		And I added an album
		When I follow "view album details / add tracks"	  
		And I follow "add a new track"
		And I fill in "Title" with ""
		And I press "Create Track"
		Then I should see "Invalid Fields"
		And I should see "Diamond Dogs" within "h1"