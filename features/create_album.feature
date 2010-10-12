Feature: creating a new album 
	As an authenticated user 
	I want to create albums
	So that I can build my music collection
	
	Scenario: going to the albums page
		Given I am logged in as a user
		And I added an artist
		When I am on the artists page
		And I follow "view albums"
		#Then I save and open the page
		And I should see "David Bowie" within "h1"

	Scenario: adding a new valid album
		Given I am logged in as a user
		And I added an artist
		When I am on the artists page
		And I follow "view albums"
		And I follow "add a new album"
		And I fill in "Title" with "Diamond Dogs"
		And I press "Create Album"
		Then I should see "Successfully created album."
		And I should see "Diamond Dogs"		
		#And I save and open the page
		
	Scenario: adding an invalid album
		Given I am logged in as a user
		And I added an artist
		When I am on the artists page
		And I follow "view albums"
		And I follow "add a new album"
		And I fill in "Title" with ""
		And I press "Create Album"
		Then I should see "Invalid Fields"
		And I should see "David Bowie - New Album" within "h1"
		#And I save and open the page

	Scenario: viewing album details
		Given I am logged in as a user
		And I added an artist
		And I added an album
		When I follow "view album details / add tracks"	  
		Then I should see "David Bowie - Diamond Dogs" within "h1"		
		And I should see "RCA Records"
		And I should see "add a new track"
		And I should see "add a new comment"
		And I should see "back to albums"

	Scenario: clicking the back to albums link
		Given I am logged in as a user
		And I added an artist
		And I added an album
		When I follow "view album details / add tracks"	  
		And I follow "back to albums"
		Then I should see "David Bowie" within "h1"
		And I should see "add a new album"


		
		