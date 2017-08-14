class TravellerController < ApplocationController
  before_action :authenticate_user!
end