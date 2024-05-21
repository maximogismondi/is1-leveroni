import React, { Component } from "react";
import Typography from "@mui/material/Typography";
import Container from "@mui/material/Container";
import Box from "@mui/material/Box";

export default class CallToInitializeShoppingCart extends Component {
  render() {
    return (
      <Box
        sx={{
          bgcolor: "background.paper",
          pt: 8,
          pb: 6,
        }}
      >
        <Container maxWidth="sm">
          {this.renterTitle()}
          {this.renderSubtitles()}
        </Container>
      </Box>
    );
  }

  renterTitle() {
    return (
      <Typography
        component="h1"
        variant="h2"
        align="center"
        color="text.primary"
        gutterBottom
      >
        La editorial de la FIUBA
      </Typography>
    );
  }

  renderSubtitles() {
    return (
      <>
        <Typography
          variant="h5"
          align="center"
          color="text.secondary"
          paragraph
        >
          ¡Hace tu pedido ahora!
        </Typography>
        <Typography
          variant="h6"
          align="center"
          color="text.secondary"
          paragraph
        >
          Contamos con los mejores libros técnicos
        </Typography>
      </>
    );
  }
}
