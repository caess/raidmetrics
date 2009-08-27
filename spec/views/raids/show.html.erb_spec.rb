require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "raids/show.html.erb" do
  it "should display a list of encounters for a raid if it has encounters" do
    encounter1 = stub( "Encounter" )
    encounter1.stub!( :note ).and_return "Encounter the First"
    
    encounter2 = stub( "Encounter" )
    encounter2.stub!( :note ).and_return "Encounter the Second"
    
    raid = stub( "Raid" )
    raid.stub!( :encounters ).and_return [ encounter1, encounter2 ]
    raid.stub!( :note ).and_return ""

    assigns[ :raid ] = raid
    
    render "raids/show.html.erb"
    
    response.should have_selector( "li", :count => raid.encounters.length )
    response.should contain( "Encounter the First" )
    response.should contain( "Encounter the Second" )    
  end
  
  it "should display a message if the raid has no encounters" do
    raid = stub( "Raid" )
    raid.stub!( :encounters ).and_return []
    raid.stub!( :note ).and_return ""
    
    assigns[ :raid ] = raid
    
    render "raids/show.html.erb"
    
    response.should contain( "This raid has no encounters." )
  end
  
  it "should display the note for the raid" do
    raid = stub( "Raid" )
    raid.stub!( :encounters ).and_return []
    raid.stub!( :note ).and_return "This is a raid"
    
    assigns[ :raid ] = raid
    
    render "raids/show.html.erb"
    
    response.should contain( "This is a raid" )
  end
end