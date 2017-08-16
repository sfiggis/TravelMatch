var Route = React.createClass({
  render() {
    return (
      <div>
      <h4>{ this.props.route.airline }</h4>
      <h4>{ this.props.route.currency }</h4>
      <h4>{ this.props.route.price }</h4>
      <h4>{ this.props.route.departure_at }</h4>
      <h4>{ this.props.route.return_at }</h4>
      <h4>{ this.props.route.destination_code }</h4>
      <h4>{ this.props.route.expires_at }</h4>
      <h4>{ this.props.route.currency }</h4>

      </div>
    )
  }
});
