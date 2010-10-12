Feature: creating a new artist 
	As an authenticated user 
	I want to create artists
	So that I can build my music collection

	Scenario: viewing my artists
		Given I am logged in as a user
		And I added an artist
		And I am on the home page
		When I follow "view my artists"
		Then I should be on the artists page
		And I should see "David Bowie" within "td"
		#And I save and open the page
			
	Scenario: creating a valid artist
		Given I am logged in as a user
		And I am on the new artist page
		When I fill in "Name" with "David Bowie"
		And I press "Create Artist"
		Then I should see "Successfully created artist."
		And I should see "David Bowie" within "td"
		
	Scenario: creating an invalid artist
		Given I am logged in as a user
		And I am on the new artist page
		When I fill in "Name" with ""
		And I press "Create Artist"
		Then I should see "Invalid Fields"
		And I should see "New Artist"
		