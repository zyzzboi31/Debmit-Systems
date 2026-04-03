<%-- Shared navigation bar --%>
<style>
  .cemk-navbar {
    background: #13141a;
    border-bottom: 1px solid #2a2d40;
    padding: 0 32px;
    display: flex;
    align-items: center;
    gap: 4px;
    height: 44px;
  }
  .cemk-navbar a {
    font-family: 'DM Mono', monospace;
    font-size: 0.7rem;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: #5a5e72;
    text-decoration: none;
    padding: 6px 14px;
    border-radius: 2px;
    border: 1px solid transparent;
    transition: color 0.2s, border-color 0.2s, background 0.2s;
  }
  .cemk-navbar a:hover {
    color: #c8f04a;
    border-color: #2a2d40;
    background: #1a1b24;
  }
  .cemk-navbar a.active {
    color: #c8f04a;
    border-color: #8faa2e;
    background: rgba(200,240,74,0.06);
  }
  .cemk-navbar-divider {
    width: 1px;
    height: 16px;
    background: #2a2d40;
    margin: 0 6px;
  }
</style>

<nav class="cemk-navbar">
  <a href="home.jsp">Home</a>
  <div class="cemk-navbar-divider"></div>
  <a href="about-us.jsp">About Us</a>
  <a href="register-student.jsp">Register Student</a>
  <a href="view-all-students.jsp">All Students</a>
  <div class="cemk-navbar-divider"></div>
  <a href="contact-us.jsp">Contact Us</a>
</nav>
