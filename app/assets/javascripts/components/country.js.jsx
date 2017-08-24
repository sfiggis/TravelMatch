var Country = React.createClass({
  render() {
    return (
      <div className="country">
      <a href={"/countries/" + this.props.country.id + "?search=" + this.props.search.id}><h4>{ this.props.country.name }</h4></a>
      <button className="more-info">Find Destination!</button>
      </div>
    )
  }
});