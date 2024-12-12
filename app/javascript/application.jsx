// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import Rails from "@rails/ujs";
import React from 'react';
import ReactDOM from 'react-dom';
import NavBar from '/components/NavBar'; // Correct relative path assuming import map

document.addEventListener('DOMContentLoaded', () => {
   console.log('DOM fully loaded');
   const navRoot = document.getElementById('nav-root');
   console.log('nav-root element:', navRoot);

   const isLoggedIn = document.body.dataset.loggedIn === 'true';
   console.log('Is Logged In:', isLoggedIn);

   if (navRoot) {
     ReactDOM.render(
       React.createElement(NavBar, { isLoggedIn: isLoggedIn }),
       navRoot
     );
     console.log('NavBar rendered');
   } else {
     console.log('nav-root not found');
   }
 });

Rails.start();