var Country = React.createClass({
  render() {
    return (
      <div>
      <a href={"/countries/" + this.props.country.id }><h4>{ this.props.country.name }</h4></a>
      </div>
    )
  }
});