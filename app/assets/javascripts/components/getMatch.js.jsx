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
  $.getJSON( "/searches/" + this.props.search.id + "/matches", function( data ) {
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
          <h1>Your Matches From <span id="origin">{ this.state.currentSearch.origin }</span></h1>
          <h3>{ this.state.currentSearch.departure_date } <i className="fa fa-exchange" aria-hidden="true"></i> { this.state.currentSearch.return_date }</h3>
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