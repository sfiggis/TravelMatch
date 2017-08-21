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
    console.log(this)
    if (this.state.currentSearch !== []) {
      return (
        <div id="show-search">
          <h1>Search Results</h1>
          <h2>Origin: { this.state.currentSearch.origin }</h2>
          <h3>Departure Date: { this.state.currentSearch.departure_date }</h3>
          <h3>Return Date: { this.state.currentSearch.return_date }</h3>
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