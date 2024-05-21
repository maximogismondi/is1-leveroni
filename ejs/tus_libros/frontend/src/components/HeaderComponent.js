import React, { Component } from "react";
import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";
import AutoStoriesIcon from "@mui/icons-material/AutoStories";

export default class HeaderComponent extends Component {
  render() {
    return (
      <header>
        <AppBar position="static">
          <Toolbar>
            <AutoStoriesIcon sx={{ mr: 2 }} />
            <Typography variant="h6" color="inherit" sx={{ flexGrow: 1 }}>
              Fiuba Editorial
            </Typography>
          </Toolbar>
        </AppBar>
      </header>
    );
  }
}
