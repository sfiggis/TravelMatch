require "rails_helper"

RSpec.describe SearchesController, :type => :controller do

  render_views

describe "POST #create" do
  before do
      @traveller = Traveller.new(first_name: "Joe", last_name: "Bloggs", username: "joey_blogger", email: "email@example.co.uk", password: "password", password_confirmation: "password")
      @traveller.skip_confirmation!
      @traveller.save!
      Search.api_key = "12345"
      stub_request(:get, "http://api.travelpayouts.com/v1/prices/cheap?departure_date=2017-11-01&format=json&limit=100&origin=MOW&return_date=2017-12-01&token=12345").
         with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(status: 200, body: File.read("spec/travel_payouts/cheapest_flights.json"), headers: {})
    end

    it "redirects to the show template" do
      post :create, :params => { search: { departureDate: Date.new(2017,11, 01), returnDate: Date.new(2017,12, 01), origin: "MOW", travellerId: @traveller.id} }

      expect(response).to redirect_to(assigns(:search))
    end
  end

  describe "GET #show" do
    before do
      @traveller = Traveller.new(first_name: "Joe", last_name: "Bloggs", username: "joey_blogger", email: "email@example.co.uk", password: "password", password_confirmation: "password")
      @traveller.skip_confirmation!
      @traveller.save!
      @search = @traveller.searches.create(departure_date: Date.new(2017,11, 01), return_date: Date.new(2017,12, 01), origin: "MOW")
    end

    # it "renders the index template" do
    #   get :show, params: { id: @search.id, format: :json }
    #   expect(response).to render_template(:show)
    # end
  end
end