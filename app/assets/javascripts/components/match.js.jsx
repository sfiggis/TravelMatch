var Match = React.createClass ({
  getInitialState() {
    return { 
      currentSearch: this.props.search,
      view: <CreateMatch traveller={ this.props.traveller } parent={ this } search={ this.props.search } />,
      value: 300
    }
  },

  handleClick() {
    this.matchRequest();
    this.getMatch();
  },
  getMatch() {
    this.setState({
      view: <GetMatch traveller={ this.props.traveller } parent={ this } search={ this.state.currentSearch } origin={ this.props.origin } departureDate={ this.props.departureDate } returnDate={ this.props.returnDate } budget={ this.state.value }/>
    });
  },
  matchRequest() {
    let data = JSON.stringify({
      traveller: this.props.traveller,
      search: {origin: this.props.origin,
        departureDate: this.props.departureDate,
        returnDate: this.props.returnDate,
        travellerId: this.props.traveller.id,
        budget: this.state.value }});
    var view = this
    $.ajax({
      url: "/searches/" + this.props.search.id + "/update_matches",
      type: 'PUT',
      contentType: 'application/json',
      data: data,
      success: function(data, status, xhr) {
        view.setState({
          currentSearch: this.data["search"],
        });
      }
    })
  },

  render() {
    return(
      <div>
    { this.state.view }
    </div>
    )
  }
});


  var CreateMatch = React.createClass ({
    getInitialState() {
    return { 
      value: 0,
      budget: '',
      currentSearch: []
      }
    },

    updateTextInput(event) {
      this.setState({value: event.target.value});
      this.props.parent.setState({value: event.target.value});
    
    },
    render() {
    return (
      <div className="form">
        <form id="match">
          <div className="form-wrapper">
          <h3>Find your destination match!</h3>
          <fieldset id="budget-wrapper">
            <label>Budget</label>
            <p>Choose a max budget for your trip</p>
            <input type="range" id="budget" name="budget" min="300" max="1000" onChange={ this.updateTextInput }/>
            <h4 className="slider">£{ this.state.value }</h4>
          </fieldset>
          <fieldset id="match-wrapper">
            <button className="button" onClick={ this.props.parent.handleClick} id="matchButton" value="Match">Match</button>
          </fieldset>
          </div>
        </form>
      </div>
    )
  }
});