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

  updateTextInput(event) {
    console.log(event.target.value)
    this.setState({value: event.target.value});
    (e) => this.setState({ budget: e.target.value })  
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
          <fieldset id="budget-wrapper">
            <input type="range" id="budget" name="budget" min="300" max="10000" onChange={ this.updateTextInput }/>
            <h4 className="slider">£{ this.state.value }</h4>
          </fieldset>
          <fieldset>
            <button className="button" onClick={ this.props.parent.handleClick } id="matchButton" value="Match">Match</button>
          </fieldset>  
          <fieldset>
            <button className="button" onClick={ this.props.parent.handleClick } id="searchButton" value="Quick Search">Quick Search</button>
          </fieldset>
        </form>
      </div>
    ) 
  }
});