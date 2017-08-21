var Country = React.createClass({
  render() {
    console.log(this.props)
    return (
      <div>
      <a href={"/countries/" + this.props.country.id + "?search=" + this.props.search.id}><h4>{ this.props.country.name }</h4></a>
      </div>
    )
  }
});