class Airport extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      flights: [],
      view: '',
      rendered: false,
      currentAirport: []
    }
    // this.handleClick = this.handleClick.bind(this);
    // this.request = this.request.bind(this);
    // this.showFlights = this.showFlights.bind(this);
    this.dataSource = this.dataSource.bind(this);
  }

  showFlights() {
    this.setState({
      view: <FlightsList airport={ this.props.airport } flights={ this.state.flights }/>
    })
  }

  // request() {
  //   var search;
  //   if(this.props.search) {
  //     search = this.props.search.id
  //   }
  //   let data = JSON.stringify({
  //     search_id: search,
  //     airport_id: this.props.airport.id });
  //   var view = this
  //   $.ajax({
  //     url: "/airports/" + this.props.airport.id + "get_flights",
  //     type: 'PUT',
  //     contentType: 'application/json',
  //     data: data,
  //     success: function(data, status, xhr) {
  //       view.setState({
  //         flights: this.data["search"]
  //       });
  //       view.showFlights
  //     }
  //   })
  // }

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

  // handleClick() {
  //   this.setState({
  //     view: <ShowAirport /
  //   })
  // }
  render() {
    if(this.state.currentAirport.images != undefined) {
      // console.log(this.state.currentAirport.images[0]);
      return(
        <div>
          <h2>{ this.props.airport.municipality }</h2>
          <h3>{ this.props.airport.name }</h3>
          <img src={ this.state.currentAirport.images[0] }/>
          <a href={ "https://en.wikipedia.org/wiki/" + this.props.airport.municipality }><h4>Learn More</h4></a>
          <a id="learn_more" href={"/airports/" +  this.props.airport.id }>Learn More</a>
      </div>)
    } else {
      return (
      <div>
        <h2>{ this.props.airport.municipality }</h2>
        <h3>{ this.props.airport.name }</h3>
        <a href={ "https://en.wikipedia.org/wiki/" + this.props.airport.municipality }><h4>Learn More</h4></a>
        <button id="learn_more" href={"/airports/" +  this.props.airport.id }>Learn More</button>
      </div>
      )
    }
  }
}