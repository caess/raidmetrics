require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "raids/index.html.erb" do
  context "raids have been imported" do
    before( :each ) do
      raid1 = stub( "Raid" )
      raid1.stub!( :note ).and_return "Raid the First"
      raid1.stub!( :id ).and_return 1
    
      raid2 = stub( "Raid" )
      raid2.stub!( :note ).and_return "Raid the Second"
      raid2.stub!( :id ).and_return 2
    
      @raids = [ raid1, raid2 ]
      assigns[ :raids ] = @raids
    end
    
    it "should display a list of raids if raids have been imported" do
      render "raids/index.html.erb"
    
      response.should have_selector( "li", :count => @raids.length )
      response.should contain( "Raid the First" )
      response.should contain( "Raid the Second" )    
    end
  
    it "should display links for all raids that have been imported" do
      render "raids/index.html.erb"
    
      response.should have_selector( "a", :count => @raids.length )
    end
  end
  
  it "should display a message if no raids have been imported" do
    raids = []
    assigns[ :raids ] = raids
    
    render "raids/index.html.erb"
    
    response.should contain( "There are no raids currently analyzed." )
  end
end