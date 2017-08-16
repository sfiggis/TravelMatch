class Search extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      currentTraveller: this.props.traveller,
      currentSearch: {},
      origin: '',
      departureDate: '',
      returnDate: '',
      view: <CreateSearch traveller={ this.props.traveller } parent={ this }/>
    };
    this.handleClick = this.handleClick.bind(this);
    this.request = this.request.bind(this);
    this.show = this.show.bind(this);
  };

  render() {
    return <div>
      { this.state.view }
    </div>
  }

  request() {
    let data = JSON.stringify({search: {origin: this.state.origin, departureDate: this.state.departureDate, returnDate: this.state.returnDate, travellerId: this.state.currentTraveller.id }})
    $.ajax({
      url: "/searches",
      type: 'POST',
      contentType: 'application/json',
      data: data,
      success: function(data, status, xhr) {
      }
    })
  }

  show() {
    this.setState({
      view: <ShowSearch traveller={ this.props.traveller } parent={ this } />
    })
  }

   handleClick() {
    this.request();
    this.show();
  }
}
    

var CreateSearch = React.createClass( {
  render() {
    return (
      <form id="search">
        <h1>Search</h1>
        <fieldset>
          <input type="text" id="origin" defaultValue="Origin" onChange={ (e) => this.props.parent.setState({ origin: e.target.value }) }/>
        </fieldset>
        <fieldset>
          <input type="date" id="departureDate" defaultValue="Departure Date" onChange={ (e) => this.props.parent.setState({ departureDate: e.target.value }) }/>
        </fieldset>
        <fieldset>
          <input type="date" id="returnDate" defaultValue="Return Date" onChange={ (e) => this.props.parent.setState({ returnDate: e.target.value }) }/>
        </fieldset>
        <fieldset>
          <button onClick={ this.props.parent.handleClick } id="searchButton" value="Search">Submit</button>
        </fieldset> 
      </form>
    ) 
  }
});