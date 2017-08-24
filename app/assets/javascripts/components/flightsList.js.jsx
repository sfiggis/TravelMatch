class FlightsList extends React.Component {
  render() {
  if(this.props.flights !== undefined && this.props.flights !== null) {
    const listItems = this.props.flights.map((flight) =>
      <li className="flight" key={ flight[0] }>
        <Flight airport={ this.props.airport } country={ this.props.country } flight={ flight } parent={ this }/>
      </li>)
    return(
      <div>{ listItems }</div>
      )
  } else {
    return(
      <div>waiting...</div>
      )
    }
  }
}