Feature: uploading a cover image for an album
	As an authenticated user 
	I want to add cover images to my albums
	So more valuable information is added to my music collection
	
	Scenario: viewing new cover page
		Given I am logged in as a user
		And I added an artist
		And I added an album
		When I follow "add album cover"	  
		Then I should see "David Bowie - Diamond Dogs" within "h1"		
		And I should see "Add/edit Album Cover" within "h2"

	Scenario: adding a blank cover
		Given I am logged in as a user
		And I added an artist
		And I added an album
		When I follow "add album cover"	  
		And I press "Create Cover"
		Then I should see "Invalid Fields"
		And I should see "David Bowie - Diamond Dogs" within "h1"
		And I should see "Add/edit Album Cover" within "h2"
