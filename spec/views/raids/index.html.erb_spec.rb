require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "raids/index.html.erb" do
  it "should display a list of raids if raids have been imported" do
    raid1 = stub( "Raid" )
    raid1.stub!( :note ).and_return "Raid the First"
    
    raid2 = stub( "Raid" )
    raid2.stub!( :note ).and_return "Raid the Second"
    
    raids = [ raid1, raid2 ]
    assigns[ :raids ] = raids
    
    render "raids/index.html.erb"
    
    response.should have_selector( "li", :count => raids.length )
    response.should contain( "Raid the First" )
    response.should contain( "Raid the Second" )    
  end
  
  it "should display a message if no raids have been imported" do
    raids = []
    assigns[ :raids ] = raids
    
    render "raids/index.html.erb"
    
    response.should contain( "There are no raids currently analyzed." )
  end
end