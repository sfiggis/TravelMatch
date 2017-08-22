var CountryList = React.createClass({
  render() {

    if(this.props.countries !== undefined && this.props.countries !== null) {
      const listItems = this.props.countries.map((country) =>
        <li className="country" key={ country.id }>
        <Country search={ this.props.search } country={ country } />
      </li>)

      return (
        <div>
          <h1>Countries</h1>
          <ul className="country-listings">
            { listItems }
          </ul>
        </div>
      )
    } else {
        return (
          <h2>Waiting...</h2>
        )
      }
    }
});