
Given /^the search index is updated$/ do
  ThinkingSphinx::Test.index
  sleep(1)
end

Then /^I save and open the page$/ do 
  save_and_open_page 
end 

Before do
  # Add your own models here instead.
  #[User, Artist, Album, Track, Comment, Cover, User_session].each do |model|
  #  model.delete_all
  #end
end

