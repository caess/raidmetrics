class RaidsController < ActionController::Base
  def index
    @raids = Raid.find( :all )
  end
  
  def show
    @raid = Raid.find( params[ :id ].to_i )
  end
end