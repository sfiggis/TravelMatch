class Airport extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      flights: [],
      view: '',
      rendered: false,
      currentAirport: []
    }
    this.dataSource = this.dataSource.bind(this);
  }

  showFlights() {
    this.setState({
      view: <FlightsList airport={ this.props.airport } flights={ this.state.flights }/>
    })
  }

  componentWillUpdate() {
    if(this.state.rendered === false) {
      this.dataSource();
    };
  };

  componentDidMount() {
    this.dataSource();
  };

  dataSource() {
  var component = this;
  $.getJSON( "/airports/" + this.props.airport.id, function( data ) {
    component.setState({
      currentAirport: data,
      rendered: true
    });
    }.bind(this));
  };

  render() {
    if(this.state.currentAirport.images != undefined) {
      return(
        <div className="airport-content">
          <img src={ this.state.currentAirport.images[0] }/>
          <h2>{ this.props.airport.municipality }</h2>
          <h3>{ this.props.airport.name }</h3>
          <a href={"/airports/" +  this.props.airport.id } id="learn_more" className="btn btn-default">Discover!</a>
        </div>)
    } else {
      return (
      <div className="airport-content">
        <h2>{ this.props.airport.municipality }</h2>
        <h3>{ this.props.airport.name }</h3>
        <a href={"/airports/" +  this.props.airport.id } id="learn_more" className="btn btn-default">Discover!</a>
      </div>
      )
    }
  }
}