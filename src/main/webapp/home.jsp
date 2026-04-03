<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CEMK — Home</title>
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Mono:wght@300;400&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

    :root {
      --bg:         #0b0c10;
      --surface:    #13141a;
      --surface-2:  #1a1b24;
      --border:     #1f2130;
      --border-mid: #2a2d40;
      --accent:     #c8f04a;
      --accent-dim: #8faa2e;
      --text:       #e8eaf0;
      --muted:      #5a5e72;
      --glow:       rgba(200, 240, 74, 0.15);
    }

    html, body {
      min-height: 100%;
      background: var(--bg);
      color: var(--text);
      font-family: 'Syne', sans-serif;
    }

    /* Grid lines */
    body::after {
      content: '';
      position: fixed; inset: 0;
      background-image:
        linear-gradient(var(--border) 1px, transparent 1px),
        linear-gradient(90deg, var(--border) 1px, transparent 1px);
      background-size: 60px 60px;
      pointer-events: none;
      z-index: 0;
      opacity: 0.3;
    }

    /* ── Top Navbar ── */
    .navbar {
      position: fixed; top: 0; left: 0; right: 0;
      z-index: 100;
      height: 56px;
      background: rgba(11, 12, 16, 0.85);
      backdrop-filter: blur(12px);
      border-bottom: 1px solid var(--border-mid);
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 32px;
    }

    .navbar::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 2px;
      background: linear-gradient(90deg, var(--accent), transparent 60%);
    }

    .nav-brand {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .nav-logo {
      font-size: 1.1rem;
      font-weight: 800;
      letter-spacing: -0.02em;
      color: var(--text);
    }

    .nav-logo span { color: var(--accent); }

    .nav-tag {
      font-family: 'DM Mono', monospace;
      font-size: 0.6rem;
      letter-spacing: 0.15em;
      color: var(--muted);
      border: 1px solid var(--border-mid);
      padding: 2px 8px;
      border-radius: 2px;
      text-transform: uppercase;
    }

    .nav-right {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .nav-user {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .nav-user-info {
      text-align: right;
    }

    .nav-user-id {
      font-family: 'DM Mono', monospace;
      font-size: 0.75rem;
      color: var(--text);
    }

    .nav-user-role {
      font-family: 'DM Mono', monospace;
      font-size: 0.62rem;
      color: var(--accent);
      text-transform: uppercase;
      letter-spacing: 0.1em;
    }

    .nav-avatar {
      width: 32px; height: 32px;
      background: var(--surface-2);
      border: 1px solid var(--border-mid);
      border-radius: 2px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: 'DM Mono', monospace;
      font-size: 0.7rem;
      font-weight: 400;
      color: var(--accent);
      text-transform: uppercase;
    }

    .btn-logout {
      font-family: 'DM Mono', monospace;
      font-size: 0.68rem;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      color: var(--muted);
      background: transparent;
      border: 1px solid var(--border-mid);
      border-radius: 2px;
      padding: 6px 14px;
      cursor: pointer;
      text-decoration: none;
      transition: color 0.2s, border-color 0.2s;
    }

    .btn-logout:hover {
      color: var(--accent);
      border-color: var(--accent-dim);
    }

    /* ── Main content ── */
    .main {
      position: relative;
      z-index: 1;
      padding: 88px 32px 48px;
      max-width: 1100px;
      margin: 0 auto;
    }

    /* ── Welcome section ── */
    .welcome {
      margin-bottom: 40px;
      opacity: 0;
      animation: fadeUp 0.6s ease forwards 0.2s;
    }

    .welcome-tag {
      font-family: 'DM Mono', monospace;
      font-size: 0.68rem;
      letter-spacing: 0.2em;
      color: var(--accent);
      text-transform: uppercase;
      margin-bottom: 10px;
    }

    .welcome-title {
      font-size: clamp(1.8rem, 4vw, 2.6rem);
      font-weight: 800;
      letter-spacing: -0.03em;
      line-height: 1.05;
    }

    .welcome-title span { color: var(--accent); }

    .welcome-sub {
      margin-top: 8px;
      font-family: 'DM Mono', monospace;
      font-size: 0.78rem;
      color: var(--muted);
    }

    /* ── Stat cards row ── */
    .stats-row {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 12px;
      margin-bottom: 32px;
      opacity: 0;
      animation: fadeUp 0.6s ease forwards 0.35s;
    }

    .stat-card {
      background: var(--surface);
      border: 1px solid var(--border-mid);
      border-radius: 3px;
      padding: 18px 20px;
      position: relative;
      overflow: hidden;
    }

    .stat-card::before {
      content: '';
      position: absolute;
      top: 0; left: 0;
      width: 3px; height: 100%;
      background: var(--accent);
      opacity: 0.5;
    }

    .stat-label {
      font-family: 'DM Mono', monospace;
      font-size: 0.62rem;
      letter-spacing: 0.15em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 8px;
    }

    .stat-value {
      font-size: 1.6rem;
      font-weight: 800;
      letter-spacing: -0.03em;
      color: var(--text);
    }

    .stat-value span { color: var(--accent); font-size: 0.9rem; margin-left: 4px; }

    /* ── Section header ── */
    .section-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 14px;
    }

    .section-title {
      font-family: 'DM Mono', monospace;
      font-size: 0.7rem;
      letter-spacing: 0.18em;
      text-transform: uppercase;
      color: var(--muted);
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .section-title::before {
      content: '';
      display: inline-block;
      width: 8px; height: 1px;
      background: var(--accent);
    }

    /* ── Quick action cards ── */
    .actions-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 12px;
      margin-bottom: 32px;
      opacity: 0;
      animation: fadeUp 0.6s ease forwards 0.5s;
    }

    .action-card {
      background: var(--surface);
      border: 1px solid var(--border-mid);
      border-radius: 3px;
      padding: 22px 22px 18px;
      cursor: pointer;
      text-decoration: none;
      display: block;
      transition: border-color 0.2s, box-shadow 0.2s, transform 0.2s;
      position: relative;
      overflow: hidden;
    }

    .action-card::after {
      content: '';
      position: absolute;
      inset: 0;
      background: var(--glow);
      opacity: 0;
      transition: opacity 0.3s;
    }

    .action-card:hover {
      border-color: var(--accent-dim);
      box-shadow: 0 0 20px rgba(200, 240, 74, 0.08);
      transform: translateY(-2px);
    }

    .action-card:hover::after { opacity: 1; }

    .action-icon {
      font-family: 'DM Mono', monospace;
      font-size: 1.1rem;
      color: var(--accent);
      margin-bottom: 12px;
      display: block;
    }

    .action-title {
      font-size: 0.95rem;
      font-weight: 700;
      letter-spacing: -0.01em;
      color: var(--text);
      margin-bottom: 4px;
    }

    .action-desc {
      font-family: 'DM Mono', monospace;
      font-size: 0.68rem;
      color: var(--muted);
      line-height: 1.5;
    }

    .action-arrow {
      position: absolute;
      bottom: 18px; right: 20px;
      font-size: 0.75rem;
      color: var(--muted);
      transition: color 0.2s, transform 0.2s;
    }

    .action-card:hover .action-arrow {
      color: var(--accent);
      transform: translate(3px, -3px);
    }

    /* ── Session info panel ── */
    .session-panel {
      background: var(--surface);
      border: 1px solid var(--border-mid);
      border-radius: 3px;
      padding: 20px 22px;
      opacity: 0;
      animation: fadeUp 0.6s ease forwards 0.65s;
    }

    .session-row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 9px 0;
      border-bottom: 1px solid var(--border);
    }

    .session-row:last-child { border-bottom: none; }

    .session-key {
      font-family: 'DM Mono', monospace;
      font-size: 0.68rem;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      color: var(--muted);
    }

    .session-val {
      font-family: 'DM Mono', monospace;
      font-size: 0.78rem;
      color: var(--text);
    }

    .badge {
      font-family: 'DM Mono', monospace;
      font-size: 0.62rem;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      padding: 3px 10px;
      border-radius: 2px;
      background: rgba(200, 240, 74, 0.1);
      color: var(--accent);
      border: 1px solid rgba(200, 240, 74, 0.2);
    }

    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(16px); }
      to   { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>

  <%
    HttpSession userSession = request.getSession(false);
    String userId   = (userSession != null) ? (String) userSession.getAttribute("user-id")   : "Guest";
    String userRole = (userSession != null) ? (String) userSession.getAttribute("user-role") : "unknown";
    String userPwd  = (userSession != null) ? (String) userSession.getAttribute("user-password") : "";

    // Build initials from userId
    String initials = (userId != null && userId.length() >= 2)
                      ? userId.substring(0, 2).toUpperCase()
                      : "??";
  %>

  <!-- Navbar -->
  <nav class="navbar">
    <div class="nav-brand">
      <div class="nav-logo">CEM<span>K</span></div>
      <span class="nav-tag">Dashboard</span>
    </div>
    <div class="nav-right">
      <div class="nav-user">
        <div class="nav-user-info">
          <div class="nav-user-id"><%= userId %></div>
          <div class="nav-user-role"><%= userRole %></div>
        </div>
        <div class="nav-avatar"><%= initials %></div>
      </div>
      <a href="index.html" class="btn-logout">Logout</a>
    </div>
  </nav>

  <!-- Main -->
  <main class="main">

    <!-- Welcome -->
    <div class="welcome">
      <div class="welcome-tag">&#9632; Dashboard</div>
      <h1 class="welcome-title">Hello, <span><%= userId %></span></h1>
      <p class="welcome-sub">// Logged in as <%= userRole %> &mdash; Student &amp; User Management System</p>
    </div>

    <!-- Stats -->
    <div class="stats-row">
      <div class="stat-card">
        <div class="stat-label">Session</div>
        <div class="stat-value">Active <span>&#9679;</span></div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Role</div>
        <div class="stat-value" style="font-size:1.2rem; text-transform:capitalize;"><%= userRole %></div>
      </div>
      <div class="stat-card">
        <div class="stat-label">System</div>
        <div class="stat-value" style="font-size:1.2rem;">Online <span>&#9679;</span></div>
      </div>
    </div>

    <!-- Quick Actions -->
    <div class="section-header">
      <div class="section-title">Quick Actions</div>
    </div>

    <div class="actions-grid">
      <a href="#" class="action-card">
        <span class="action-icon">[+]</span>
        <div class="action-title">Register Student</div>
        <div class="action-desc">Add a new student record to the system</div>
        <span class="action-arrow">&#8599;</span>
      </a>
      <a href="#" class="action-card">
        <span class="action-icon">[&#9776;]</span>
        <div class="action-title">View All Students</div>
        <div class="action-desc">Browse and search all student records</div>
        <span class="action-arrow">&#8599;</span>
      </a>
      <a href="#" class="action-card">
        <span class="action-icon">[&#9998;]</span>
        <div class="action-title">Update Student</div>
        <div class="action-desc">Edit an existing student's information</div>
        <span class="action-arrow">&#8599;</span>
      </a>
      <a href="#" class="action-card">
        <span class="action-icon">[&#215;]</span>
        <div class="action-title">Delete Student</div>
        <div class="action-desc">Remove a student record from the system</div>
        <span class="action-arrow">&#8599;</span>
      </a>
    </div>

    <!-- Session Info -->
    <div class="section-header">
      <div class="section-title">Session Info</div>
    </div>

    <div class="session-panel">
      <div class="session-row">
        <span class="session-key">User ID</span>
        <span class="session-val"><%= userId %></span>
      </div>
      <div class="session-row">
        <span class="session-key">Role</span>
        <span class="badge"><%= userRole %></span>
      </div>
      <div class="session-row">
        <span class="session-key">Auth Status</span>
        <span class="badge">Authenticated</span>
      </div>
      <div class="session-row">
        <span class="session-key">System</span>
        <span class="session-val">CEMK v1.0.0</span>
      </div>
    </div>

  </main>

</body>
</html>
