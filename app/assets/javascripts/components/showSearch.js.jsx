class ShowSearch extends Search {
  constructor(props) {
    super(props);
    this.state = {
      currentSearch: []
    };
  };


componentWillReceiveProps() {
  var component = this;
  $.getJSON( "/searches/" + this.props.search.id, function( data ) {
    console.log(JSON.stringify(data, undefined, 2))
    component.setState({currentSearch: data});
    }.bind(this));
}

  render() {
    if (this.state.currentSearch !== []) {
      return (
        <div id="show-search">
          <h1>Top Flights from { this.state.currentSearch.origin }</h1>
          <h2>{ this.state.currentSearch.departure_date }</h2>
          <h3><i className="fa fa-exchange" aria-hidden="true"></i></h3>
          <h2>{ this.state.currentSearch.return_date }</h2>
          <RouteList airports={ this.state.currentSearch.airports } routes={this.state.currentSearch.flight_results } search={ this.props.search } parent={ this }/>
        </div>
      ) 
    } else {
      return (
        <div>Waiting...</div>
        )
    }
  }
};