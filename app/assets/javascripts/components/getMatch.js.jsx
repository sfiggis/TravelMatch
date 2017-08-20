class GetMatch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentSearch: [],
      rendered: false
    };
    this.dataSource = this.dataSource.bind(this);
  };

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
  $.getJSON( "/searches/" + this.props.search.id, function( data ) {
    component.setState({
      currentSearch: data,
      rendered: true
    });
    }.bind(this));
  };

  render() {
    if (this.state.currentSearch !== []) {
      return (
        <div className="show-search">
          <h1>Search Results</h1>
          <h2>Origin: { this.state.currentSearch.origin } | { this.state.currentSearch.departure_date }</h2>
          <h3>{ this.state.currentSearch.departure_date } - { this.state.currentSearch.return_date }</h3>
          <CountryList countries={ this.state.currentSearch.destination_results } routes={this.state.currentSearch.flight_results } search={ this.props.search } parent={ this }/>
        </div>
      ) 
    } else {
      return (
        <div>Waiting...</div>
      );
    }
  }
};