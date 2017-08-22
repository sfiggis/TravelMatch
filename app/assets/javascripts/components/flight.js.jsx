class Flight extends React.Component {

  render() {
    return(
      <div>
      <h3><strong>{ this.props.flight.month }</strong></h3>
      <h4><strong>{ this.props.flight.destination_code }</strong></h4>
      <h4>{ this.props.destination_code }</h4>
      <h4>Departure Date: { this.props.flight.departure_at }</h4>
      <h4>Return Date:{ this.props.flight.return_at }</h4>
      <h4>{ this.props.flight.price } { this.props.flight.currency }</h4>
      <h4>Transfers: { this.props.flight.transfers }</h4>

      </div>
      )
  }
}