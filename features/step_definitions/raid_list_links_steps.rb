Then /^all raids should have a link to their encounter list\.$/ do
  visit raids_index_path
  
  response.should have_selector( "a", :count => Raid.count )
end
