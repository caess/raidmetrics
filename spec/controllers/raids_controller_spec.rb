require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RaidsController, "GET index" do
  it "should show a list of raids" do
    Raid.should_receive( :find ).with( :all )
    get :index
  end
end

describe RaidsController, "GET show" do
  it "should show a list of encounters for a raid" do
    Raid.should_receive( :find ).with( 42 )
    get :show, :id => 42
  end
end