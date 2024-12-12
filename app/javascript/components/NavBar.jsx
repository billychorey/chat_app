// app/javascript/components/NavBar.js
import React from 'react';

const NavBar = ({ isLoggedIn }) => {
  return (
    <nav>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/chat_rooms">Chat Rooms</a></li>
        {isLoggedIn ? (
          <li><a href="/logout" data-method="delete">Log Out</a></li>
        ) : (
          <>
            <li><a href="/sessions/new">Log In</a></li>
            <li><a href="/users/new">Sign Up</a></li>
          </>
        )}
      </ul>
    </nav>
  );
};

export default NavBar;
