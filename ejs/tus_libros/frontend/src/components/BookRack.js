import React, { Component } from "react";
import PropTypes from "prop-types";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Card from "@mui/material/Card";
import CardMedia from "@mui/material/CardMedia";
import CardContent from "@mui/material/CardContent";
import CardActions from "@mui/material/CardActions";
import Button from "@mui/material/Button";
import { Rating, Box } from "@mui/material";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";

export default class BookRack extends Component {
  static propTypes = {
    app: PropTypes.object.isRequired,
  };

  constructor(props) {
    super(props);
    this._books = this.props.app.books();
  }

  render() {
    return (
      <Grid container spacing={4}>
        {this._books.map((aBook) => (
          <Grid item key={aBook.isbn} xs={12} sm={6} md={4}>
            {this.renderBook(aBook)}
          </Grid>
        ))}
      </Grid>
    );
  }

  renderBook(aBook) {
    return (
      <Card sx={{ height: "100%", display: "flex", flexDirection: "column" }}>
        {this.renderBookCoverOf(aBook)}
        {this.renderBookDetailOf(aBook)}
        {this.renderBookActionsOn(aBook)}
      </Card>
    );
  }

  renderBookCoverOf(aBook) {
    return (
      <CardMedia component="div" sx={{ pt: "56.25%" }} image={aBook.cover} />
    );
  }

  renderBookDetailOf(aBook) {
    return (
      <CardContent sx={{ flexGrow: 1 }}>
        <Typography gutterBottom variant="h5" component="h2">
          {aBook.title}
        </Typography>
        <Typography>{aBook.description.slice(0, 100) + "..."}</Typography>
        <Rating value={aBook.score} precision={0.5} readOnly />
      </CardContent>
    );
  }

  renderBookActionsOn(aBook) {
    return (
      <CardActions>
        <Box
          sx={{
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            width: "100%",
            p: 1,
            m: 1,
          }}
        >
          <Button
            style={{ border: 0 }}
            onClick={() => {}}
            title="Agregar al carrito"
          >
            <ShoppingCartIcon />
          </Button>
        </Box>
      </CardActions>
    );
  }
}
