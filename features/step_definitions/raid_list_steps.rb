Given /^that raids have been analyzed$/ do
  raid1 = Raid.create!( :note => "Raid the First", :time => Time.now )
  raid2 = Raid.create!( :note => "Raid the Second", :time => Time.now )
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

Then /^"There are no raids currently analyzed." should be displayed$/ do
  visit raids_index_path
  
  response.should contain( "There are no raids currently analyzed." )
end
