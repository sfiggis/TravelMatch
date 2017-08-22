require "rack_session_access/capybara"

def current_traveller
@current_traveller ||= Traveller.first
end