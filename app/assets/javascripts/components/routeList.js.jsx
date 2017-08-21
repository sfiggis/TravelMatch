var RouteList = React.createClass({
  render() {

    if(this.props.routes !== undefined) {
      console.log(this.props.routes[0])
      const listItems = this.props.routes.map((item) =>
        item.map((route) => <li className="route" key={ route.id }>
        <Route route={ route } />
      </li>));
      console.log(listItems)

      return (
        <div>
          <h1>Routes</h1>
          <ul className="project-listings">
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