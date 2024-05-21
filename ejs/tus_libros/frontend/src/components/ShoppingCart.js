import React, { Component } from "react";
import Typography from "@mui/material/Typography";
import {
  Avatar,
  Divider,
  List,
  ListItem,
  ListItemAvatar,
  ListItemText,
} from "@mui/material";
import Box from "@mui/material/Box";
import Container from "@mui/material/Container";

export default class ShoppingCart extends Component {
  constructor(props) {
    super(props);
    this.state = {
      items: [
        {
          article: {
            title: "Smalltalk-80: The Language and its Implementation",
            authors: ["Adele Goldberg", "David Robson"],
            cover: "https://source.unsplash.com/random?wallpapers",
          },
          quantity: 1,
        },
        {
          article: {
            title: "Smalltalk Best Practice Patterns",
            authors: ["Kent Beck"],
            cover: "https://source.unsplash.com/random?wallpapers",
          },
          quantity: 1,
        },
        {
          article: {
            title:
              "Modern Software Engineering: Doing What Works to Build Better Software Faster",
            authors: ["David Farley"],
            cover: "https://source.unsplash.com/random?wallpapers",
          },
          quantity: 1,
        },
      ],
    };
  }

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
          {this.renderItems()}
        </Container>
      </Box>
    );
  }

  renterTitle() {
    return (
      <Typography
        variant="h5"
        align="center"
        color="text.secondary"
        gutterBottom
      >
        ¡Ya casi son tuyos!
      </Typography>
    );
  }

  renderItems() {
    return (
      <List sx={{ width: "100%", maxWidth: 360, bgcolor: "background.paper" }}>
        {this.state.items.map((cartItem) => this.renderItem(cartItem))}
      </List>
    );
  }

  renderItem(cartItem) {
    return (
      <>
        <ListItem alignItems="flex-start">
          <ListItemAvatar>
            <Avatar src={cartItem.article.cover} />
          </ListItemAvatar>
          <ListItemText
            primary={cartItem.article.title}
            secondary={
              <>
                <Typography
                  sx={{ display: "inline" }}
                  component="span"
                  variant="body2"
                  color="text.secondary"
                >
                  por {cartItem.article.authors.join(", ")}
                </Typography>
              </>
            }
          />
        </ListItem>
        <Divider variant="inset" component="li" />
      </>
    );
  }
}
