var Route = React.createClass({
  render() {
    return (
      <div id="route-info">
      <h4> Destination: { this.props.route.destination_code }</h4>
      <div id="price-wrap"><h4 id="price"> { this.props.route.price } { this.props.route.currency }</h4></div>
      <h4> { this.props.route.departure_at } <i className="fa fa-exchange" aria-hidden="true"></i> { this.props.route.return_at }</h4>

      </div>
    )
  }
});
