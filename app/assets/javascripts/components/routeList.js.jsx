var RouteList = React.createClass({
  render() {

    if(this.props.routes !== undefined) {
      const listItems = this.props.routes.map((item) =>
        item.map((route) => <li className="route" key={ route.id }>
        <Route route={ route } />
      </li>));

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