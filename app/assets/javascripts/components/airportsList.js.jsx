class AirportsList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      flights: [],
      flightsList: ''
    };
    this.handleClick = this.handleClick.bind(this);
    this.countryFlights = this.countryFlights.bind(this);
  };

  countryFlights() {
    var search;
    if(this.props.search) {
      search = this.props.search.id
    }
    let data = JSON.stringify({
      search_id: search,
      country_id: this.props.country.id,
      });
      var view = this
      $.ajax({
        url: "/airports/" + this.props.country.id + "/capital_update",
        type: 'PUT',
        contentType: 'application/json',
        data: data,
        success: function(data, status, xhr) {
          view.setState({
            flights: data["flight_results"]
          });
          view.flightList();
        }
      })
    };

  flightList() {
    this.setState({
      flightsList: <FlightsList flights={ this.state.flights } country={ this.props.country } airports={ this.props.airports }/>

    })
  }

  handleClick() {
    this.countryFlights();
    this.flightList();
  };
  render() {
    console.log(this.state.flightsList)
    if(this.props.airports !== undefined && this.props.airports !== null) {
      const listItems = this.props.airports.map((airport) =>
        <li className="airport" key={ airport.id }>
        <Airport search={ this.props.search } airport={ airport } country={ this.props.country }/>
      </li>)
      return (
        <div id="airport-wrapper">
        <button onClick={ this.handleClick } id="top-flights-button">Top Flights</button>
        <div>{ this.state.flightsList }</div>
        <div id="airport-wrap">{listItems}</div>
        </div>
      )
    } else {
      return(
        <div>waiting...</div>
      )
    }
  }
}