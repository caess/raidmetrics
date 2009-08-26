Given /^that raids have been analyzed$/ do
  raid1 = Raid.create!( :note => "Raid the First" )
  raid2 = Raid.create!( :note => "Raid the Second" )
end

When /^I request a list of raids$/ do
  visit raids_index_path
end

Then /^all raids should be displayed$/ do
  visit raids_index_path
  
  response.should have_selector( "li", :count => 2 )
  response.should contain( "Raid the First" )
  response.should contain( "Raid the Second" )
end

Given /^that no raids have been analyzed$/ do
  Raid.delete_all
end

Then /^"([^\"]*)" should be displayed$/ do |arg1|
  visit raids_index_path
  
  response.should contain( arg1 )
end
