
def user
  @user ||= Factory :user
end

def login
  user
  visit path_to("the homepage")
  click_link "log in"
  fill_in "Login", :with => "peter" 
  fill_in "Password", :with => "passw"
  click_button "Login"
  page.has_content?("Login successful!")
  page.has_content?("Log out")
end

Given /^I am a registered user$/ do
  user
end

When /^I login$/ do
  login
end

When /^I am logged in$/ do
  login
end

Given /^I am logged out$/ do
  #
end

When /^I login with valid credentials$/ do
  fill_in('Login', :with => @user.login)
  fill_in('Password', :with => "password")
  click_button("Login")
end

Given /^I am logged in as a user$/ do
  login
end

When /^I fill out the signup form$/ do
  fill_in('Login', :with => "indro")
  fill_in('Password', :with => "password")
  fill_in('Password confirmation', :with => "password")
  click_button("Create User")
end

Then /^I should be registered$/ do
  page.has_content?('Thank you for signing up! You are now logged in.')
end

Then /^I should be logged in$/ do
  page.has_content?('Logged in successfully.')
end

Then /^I should be logged out$/ do
  page.has_content?('You have been logged out.')
end