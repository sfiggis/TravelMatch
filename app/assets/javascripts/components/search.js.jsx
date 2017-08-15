class Search extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      currentTraveller: this.props.traveller,
      currentSearch: {},
      origin: '',
      departureDate: '',
      returnDate: ''
    }
    this.handleClick = this.handleClick.bind(this);
  };

  render() {
    return (
      <form id="search">
        <h1>Search</h1>
        <fieldset>
          <input type="text" id="origin" defaultValue="Origin" onChange={ (e) => this.setState({ origin: e.target.value }) }/>
        </fieldset>
        <fieldset>
          <input type="date" id="departureDate" defaultValue="Departure Date" onChange={ (e) => this.setState({ departureDate: e.target.value }) }/>
        </fieldset>
        <fieldset>
          <input type="date" id="returnDate" defaultValue="Return Date" onChange={ (e) => this.setState({ returnDate: e.target.value }) }/>
        </fieldset>
        <fieldset>
          <button onClick={this.handleClick} id="searchButton" value="Search">Submit</button>
        </fieldset> 
      </form>
    ) 
  }


  handleClick() {
    let data = JSON.stringify({search: {origin: this.state.origin, departureDate: this.state.departureDate, returnDate: this.state.returnDate, travellerId: this.state.currentTraveller.id }})
    console.log(data);
    $.ajax({
      url: "/searches",
      type: 'POST',
      contentType: 'application/json',
      data: data,
      success: function(data, status, xhr) {
        console.log('SHOW HERE ON RESPONSE');
      }
    })
    // var object = {
    //   departureDate: this.state.departureDate,
    //   returnDate: this.state.returnDate
    // }
    // console.log(object)
    // this.save(object);
    // $.ajax({
    //   url: "http://api.travelpayouts.com/v1/prices/cheap?origin=MOW&marker=144221&destination=HKT&depart_date=2017-11&return_date=2017-12&token=de802dc5fcdd7bdd866adf7001fc06df",
    //   type: 'GET',
    //   credentials: 'include',
    //   headers: {
    //     'x-access-token': 'de802dc5fcdd7bdd866adf7001fc06df',
    //     'accepts': 'application/json',
    //     'Access-Control-Allow-Origin':'http://api.travelpayouts.com'
    //   },
    //   contentType: 'application/json; charset=utf-8',
    //   success: function(response) {
    //     console.log(response)
    //   }
    // });
    // $.getJSON("http://api.travelpayouts.com/v1/prices/cheap?origin=MOW&destination=HKT&depart_date=2017-11&return_date=2017-12&token=de802dc5fcdd7bdd866adf7001fc06df", 
    // function(data) {
    //   console.log(response);
    // }
// );
  }

  save(args) {
    console.log(args);
    $.ajax({
      url: '/search',
      type: 'POST',
      data: { search: { departureDate: departureDate, returnDate: returnDate } },
      success: (response) => {
      }
    });
  }
}