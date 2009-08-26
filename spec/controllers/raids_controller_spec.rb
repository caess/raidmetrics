require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RaidsController, "GET index" do
  it "should show a list of raids" do
    Raid.should_receive( :find ).with( :all )
    get :index
  end
end