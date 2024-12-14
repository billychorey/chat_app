// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import Rails from "@rails/ujs";
import React from "react";
import { createRoot } from "react-dom/client";
import App from "./components/App";

// Ensure Rails UJS is initialized
Rails.start();

document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("react-root");
  if (container) {
    const root = createRoot(container);
    root.render(<App />);
  }
});
