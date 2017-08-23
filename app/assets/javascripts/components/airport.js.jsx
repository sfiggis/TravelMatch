class Airport extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      flights: [],
      view: ''
    }
    this.handleClick = this.handleClick.bind(this);
    this.request = this.request.bind(this);
    this.showFlights = this.showFlights.bind(this);
  }

  showFlights() {
    this.setState({
      view: <FlightsList airport={ this.props.airport } flights={ this.state.flights }/>
    })
  }

  request() {
    let data = JSON.stringify({
      search_id: this.props.search.id,
      id: this.props.airport.id });
    var view = this
    $.ajax({
      url: "/airports/" + this.props.airport.id + "get_flights",
      type: 'PUT',
      contentType: 'application/json',
      data: data,
      success: function(data, status, xhr) {
        view.setState({
          flights: this.data["search"]
        });
        view.showFlights
      }
    })
  }

  handleClick() {
    this.request()
    this.showFlights()
  }
  render() {
    return (
    <div>
      <h2>{ this.props.airport.municipality }</h2>
      <h3>{ this.props.airport.name }</h3>
      <a href={ "https://en.wikipedia.org/wiki/" + this.props.airport.municipality }><h4>Learn More</h4></a>
      <button id="flights_button" onClick={ this.handleClick }>Find Flights</button>
      <div>{ this.state.showFlights }</div>
    </div>
    )
  }
}