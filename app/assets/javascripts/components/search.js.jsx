class Search extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      currentTraveller: this.props.traveller,
      currentSearch: this.props.search,
      origin: '',
      departureDate: '',
      returnDate: '',
      budget: '',
      value: 0,
      view: <CreateSearch traveller={ this.props.traveller } parent={ this }/>
    };
    this.handleClick = this.handleClick.bind(this);
    this.request = this.request.bind(this);
    this.show = this.show.bind(this);
    this.createMatch = this.createMatch.bind(this);
  };

  render() {
    return <div>
      { this.state.view }
    </div>
  }

  request() {
    let data = JSON.stringify({traveller: this.props.traveller, search: {origin: this.state.origin, departureDate: this.state.departureDate, returnDate: this.state.returnDate, travellerId: this.state.currentTraveller.id }})
    var view = this
    $.ajax({
      url: "/searches/" + this.state.currentSearch.id,
      type: 'PUT',
      contentType: 'application/json',
      data: data,
      success: function(data, status, xhr) {
        view.setState({
          currentSearch: this.data["search"]
          });
        view.show();
    }
  })
  };

  createMatch() {
    this.setState({
      view: <Match traveller={ this.props.traveller } parent={ this } search={ this.state.currentSearch } origin={ this.state.origin } departureDate={ this.state.departureDate } returnDate={ this.state.returnDate }/>
    })
  }

  show() {
    this.setState({
      view: <ShowSearch traveller={ this.props.traveller } parent={ this } search={ this.props.search } />
    })
  }

   handleClick() {
    this.request();
    this.show();
  }
}
    

var CreateSearch = React.createClass( {
  getInitialState() {
    return { value: 0 }
  },

  render() {
    return (
      <div className="form">
        <form id="search">
          <fieldset id="origin-wrapper">
            <input type="text" id="origin" placeholder="Origin" onChange={ (e) => this.props.parent.setState({ origin: e.target.value }) }/>
          </fieldset>
          <fieldset id="departure-wrapper">
            <input type="date" id="departureDate" placeholder="Departure Date" onChange={ (e) => this.props.parent.setState({ departureDate: e.target.value }) }/>
          </fieldset>
          <fieldset id="return-wrapper">
            <input type="date" id="returnDate" placeholder="Return Date" onChange={ (e) => this.props.parent.setState({ returnDate: e.target.value }) }/>
          </fieldset>
          <fieldset id="button-wrapper">
            <button className="button" onClick={ this.props.parent.createMatch } id="matchLink" value="Match">Match</button>
          </fieldset>  
          <fieldset>
            <button className="button" onClick={ this.props.parent.handleClick } id="searchButton" value="Quick Search">Quick Search</button>
          </fieldset>
        </form>
      </div>
    ) 
  }
});