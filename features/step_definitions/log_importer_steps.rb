Given /^a valid log file$/ do
  @file = File.open( File.expand_path(File.dirname(__FILE__) + '/../../spec/fixtures/log_importer_test.txt'), 'r' )
end

When /^it is imported$/ do  
  @importer = LogFileImporter.new
end

Then /^all of the lines in the file should be imported as events$/ do
  original_event_count = Event.count
  
  @importer.import( @file )
  
  # log_importer_test.txt contains 45,947 lines.
  Event.count.should == original_event_count + 45_947
end

When /^it is not associated with an existing raid$/ do
  @importer.raid = nil
end

Then /^a new raid should be created$/ do
  @importer.import( @file, 100 )
  
  Raid.count.should == 1
end

Then /^all of the imported events should be associated with the new raid$/ do
  Event.all.each { |event| event.raid.should == @importer.raid  }
end

When /^it is associated with an existing raid$/ do
  @importer.raid = Raid.create!( :note => "Foo", :time => Time.parse( '7/2 19:00:00' ) )
end

Then /^all of the imported events should be associated with the existing raid$/ do
  @importer.import( @file, 100 )
  
  Event.all.each { |event| event.raid.should == @importer.raid  }
end