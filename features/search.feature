Feature: creating a new artist 
	As a visitor of the website 
	I want to search for albums and tracks
	So that I can see what people are listening to
	
	Scenario: entering a blank search term
		Given the search index is updated
		And I am on the home page
		When I fill in "Search for albums" with ""
		And I press "search albums"
		Then I should be on the home page
		And I should see "You must enter a search term."
	
	Scenario: searching for albums by title
		Given I am on the home page
		When I fill in "Search for albums" with "puppets"
		And I press "search albums"
		Then I should see "Search Results: puppets"
		And I should see "Master of Puppets"
		
	Scenario: searching for albums by artist
		Given I am on the home page
		When I fill in "Search for albums" with "metallica"
		And I press "search albums"
		Then I should see "Search Results: metallica"
		And I should see "Master of Puppets"

	Scenario: searching for tracks by title
		Given I am on the home page
		When I fill in "Search for tracks" with "battery"
		And I press "search tracks"
		Then I should see "Search Results: battery"
		And I should see "Battery"

	Scenario: searching for tracks by artist (includes different artists)
		Given I am on the home page
		When I fill in "Search for tracks" with "metallica"
		And I press "search tracks"
		Then I should see "Search Results: metallica"
		And I should see "Battery"
		And I should see "Master of Puppets"
		And I should see "The Thing That Should Not Be"
		And I should see "Battery (Metallica Cover)"
		#And I save and open the page
