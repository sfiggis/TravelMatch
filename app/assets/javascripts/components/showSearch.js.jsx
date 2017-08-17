class ShowSearch extends Search {
  constructor(props) {
    super(props);
    this.state = {
      currentSearch: {}
    };
  };

  render() {
    console.log(this)
    if (this.props.search !== undefined) {
      return (
        <div id="show-search">
          <h1>Search Results</h1>
          <h2>Origin: { this.props.search.origin }</h2>
          <h3>Departure Date: { this.props.search.departure_date }</h3>
          <h3>Return Date: { this.props.search.return_date }</h3>
          <RouteList search={ this.props.search } parent={ this }/>
        </div>
      ) 
    } else {
      return (
        <div>Waiting...</div>
        )
    }
  }
};