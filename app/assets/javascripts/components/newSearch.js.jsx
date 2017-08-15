class NewSearch extends React.component {
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
  }
}