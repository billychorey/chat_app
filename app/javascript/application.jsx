// app/javascript/application.jsx
import React from 'react';
import ReactDOM from 'react-dom';
import NavBar from './components/NavBar';

document.addEventListener('DOMContentLoaded', () => {
  const navRoot = document.getElementById('nav-root');
  if (navRoot) {
    const isLoggedIn = navRoot.dataset.loggedIn === 'true'; // Parse boolean from data attribute
    ReactDOM.render(<NavBar isLoggedIn={isLoggedIn} />, navRoot);
  }
});
