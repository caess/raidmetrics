Given /^that a raid has been imported$/ do
  @raid = Raid.create!( :note => "This is a raid" )
end

Given /^that the raid has encounters$/ do
  @raid.encounters.create!( :note => "Encounter the First" )
  @raid.encounters.create!( :note => "Encounter the Second" )
end

When /^I request the page for the raid$/ do
  visit raids_show_path( :id => @raid.id )
end

Then /^all encounters for that raid should be displayed$/ do
  visit raids_show_path( :id => @raid.id )
  
  response.should have_selector( "li", :count => @raid.encounters.length )
  response.should contain( "Encounter the First" )
  response.should contain( "Encounter the Second" )
end

Given /^that the raid does not have encounters$/ do
  @raid.encounters.each { |encounter| @raid.encounters.delete( encounter ) }
end

Then /^"This raid has no encounters." should be displayed$/ do
  visit raids_show_path( :id => @raid.id )
  
  response.should contain( "This raid has no encounters." )
end

Then /^the note for the raid should be displayed$/ do
  visit raids_show_path( :id => @raid.id )
  
  response.should contain( "This is a raid" )
end
