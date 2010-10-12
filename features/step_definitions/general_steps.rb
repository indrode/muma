Given /^I added an artist$/ do
  Given 'I am on the new artist page'
  Given 'I fill in "Name" with "David Bowie"'
  Given 'I fill in "Country" with "UK"'
  Given 'I fill in "Name" with "David Bowie"'
  Given 'I press "Create Artist"'
end

Given /^I added an album$/ do
  Given 'I follow "view albums"'
  Given 'I follow "add a new album"'
  Given 'I fill in "Title" with "Diamond Dogs"'
  Given 'I fill in "Label" with "RCA Records"'
  Given 'I press "Create Album"'
end