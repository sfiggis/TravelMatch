class GetMatch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentSearch: []
    };
    this.dataSource = this.dataSource.bind(this);
  };

  componentWillUpdate() {
    this.dataSource();
  };

  componentWillReceiveProps(nextProps) {
    this.dataSource(nextProps);
  };


  dataSource() {
  var component = this;
  console.log(this)
  $.getJSON( "/searches/" + this.props.search.id, function( data ) {
    console.log("SOMETHING")
    console.log(JSON.stringify(data, undefined, 2))
    // console.log(data)
    component.setState({currentSearch: data});
    }.bind(this));
  };

  render() {
    if (this.state.currentSearch !== []) {
      return (
        <div className="show-search">
          <h1>Search Results</h1>
          <h2>Origin: { this.state.currentSearch.origin } | { this.state.currentSearch.departure_date }</h2>
          <h3>{ this.state.currentSearch.departure_date } - { this.state.currentSearch.return_date }</h3>
          <RouteList airports={ this.state.currentSearch.airports } routes={this.state.currentSearch.flight_results } search={ this.props.search } parent={ this }/>
        </div>
      ) 
    } else {
      return (
        <div>Waiting...</div>
      );
    }
  }
};