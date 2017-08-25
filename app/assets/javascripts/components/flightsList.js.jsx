class FlightsList extends React.Component {
  render() {
    console.log(this);
  if(this.props.flights !== undefined && this.props.flights !== []) {
    const listItems = this.props.flights.map((flight) =>
      <li className="flight" key={ flight[0] }>
        <Flight airport={ this.props.airport } country={ this.props.country } flight={ flight } parent={ this }/>
      </li>)
    return(
      <ul id="flight-listings">{ listItems }</ul>
      )
  } else {
    return(
      <div>waiting...</div>
      )
    }
  }
}