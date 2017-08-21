var Main = React.createClass({
  render() {
    return (
      <div>
        <Search traveller={ this.props.traveller } search={ this.props.search }/>
      </div>
    )
  }
});