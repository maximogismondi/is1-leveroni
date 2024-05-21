import React, { Component } from "react";
import Container from "@mui/material/Container";
import BookRack from "./BookRack";
import Drawer from "@mui/material/Drawer";
import HeaderComponent from "./HeaderComponent";
import ShoppingCart from "./ShoppingCart";
import PropTypes from "prop-types";
import CallToInitializeShoppingCart from "./CallToInitializeShoppingCart";

export default class MainComponent extends Component {
  static propTypes = {
    app: PropTypes.object.isRequired,
  };

  constructor(props) {
    super(props);
    this.state = {
      showOrder: false,
    };
  }

  render() {
    return (
      <>
        {this.renderHeader()}
        {this.renderMainContent()}
      </>
    );
  }

  renderHeader() {
    return (
      <HeaderComponent onActionDo={() => this.setState({ showOrder: true })} />
    );
  }

  renderMainContent() {
    return (
      <main>
        {this.renderCallToInitializeOrder()}
        {this.renderInitializingOrder()}
        <Container sx={{ py: 8 }} maxWidth="md">
          <BookRack app={this.props.app} />
        </Container>
      </main>
    );
  }

  renderCallToInitializeOrder() {
    return (
      <CallToInitializeShoppingCart
        onActionDo={() => this.setState({ showOrder: true })}
      />
    );
  }

  renderInitializingOrder() {
    return (
      <Drawer
        anchor={"right"}
        open={this.state.showOrder}
        onClose={() => this.setState({ showOrder: false })}
      >
        {this.renderOrder()}
      </Drawer>
    );
  }

  renderOrder() {
    return <ShoppingCart />;
  }
}
