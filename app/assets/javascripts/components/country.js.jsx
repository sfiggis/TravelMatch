var Country = React.createClass({
  render() {
    return (
      <div className="country">
      <h4>{ this.props.country.name }</h4>
      <a href={"/countries/" + this.props.country.id + "?search=" + this.props.search.id}><button className="more-info-country">Find Destination!</button></a>
      </div>
    )
  }
});