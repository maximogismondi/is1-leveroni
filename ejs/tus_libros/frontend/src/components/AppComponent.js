import React, { Component } from "react";
import "../App.css";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import CssBaseline from "@mui/material/CssBaseline";
import MainComponent from "./MainComponent";
import { App } from "../app/App";

export default class AppComponent extends Component {
  constructor(props) {
    super(props);
    this._defaultTheme = createTheme();
    this._app = new App();
  }

  render() {
    return (
      <ThemeProvider theme={this._defaultTheme}>
        <CssBaseline />
        <MainComponent app={this._app} />
      </ThemeProvider>
    );
  }
}
