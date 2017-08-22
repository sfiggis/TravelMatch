class AirportsList extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    if(this.props.airports !== undefined && this.props.airports !== null) {
      const listItems = this.props.airports.map((airport) =>
        <li className="airport" key={ airport.id }>
        <Airport search={ this.props.search } airport={ airport } country={ this.props.country }/>
      </li>)
      return (
        <div>{listItems}</div>
      )
    } else {
      return(
        <div>waiting...</div>
      )
    }
  }
}