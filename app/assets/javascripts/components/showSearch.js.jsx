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
          <h1>Top Flights from <span id="origin">{ this.state.currentSearch.origin }</span></h1>
          <div id="dates-wrapper">
            <h2>{ this.state.currentSearch.departure_date }  <i className="fa fa-exchange" aria-hidden="true"></i>  { this.state.currentSearch.return_date }</h2>
          </div>
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