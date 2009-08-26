class RaidsController < ActionController::Base
  def index
    @raids = Raid.find( :all )
  end
end