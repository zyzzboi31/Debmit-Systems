<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CEMK — Login</title>
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
      --error:      #f04a4a;
      --glow:       rgba(200, 240, 74, 0.15);
    }

    html, body {
      height: 100%;
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
      opacity: 0.35;
    }

    /* Glow blob */
    .blob {
      position: fixed;
      width: 500px; height: 500px;
      background: radial-gradient(circle, rgba(200,240,74,0.06) 0%, transparent 70%);
      border-radius: 50%;
      top: 50%; left: 50%;
      transform: translate(-50%, -50%);
      pointer-events: none;
      z-index: 0;
    }

    /* Corner labels */
    .corner {
      position: fixed;
      font-family: 'DM Mono', monospace;
      font-size: 0.65rem;
      color: var(--muted);
      letter-spacing: 0.1em;
      z-index: 2;
      animation: fadeIn 0.6s ease forwards 1s;
      opacity: 0;
    }
    .corner-tl { top: 28px; left: 32px; }
    .corner-tr { top: 28px; right: 32px; }
    .corner-bl { bottom: 28px; left: 32px; }
    .corner-br { bottom: 28px; right: 32px; }

    /* Layout */
    .page {
      position: relative;
      z-index: 1;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 2rem;
    }

    /* Card */
    .card {
      width: 100%;
      max-width: 420px;
      background: var(--surface);
      border: 1px solid var(--border-mid);
      border-radius: 4px;
      overflow: hidden;
      opacity: 0;
      transform: translateY(24px);
      animation: slideUp 0.6s ease forwards 0.3s;
    }

    /* Card header */
    .card-header {
      padding: 28px 32px 24px;
      border-bottom: 1px solid var(--border);
      position: relative;
    }

    .card-header::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 2px;
      background: linear-gradient(90deg, var(--accent), transparent);
    }

    .back-link {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      font-family: 'DM Mono', monospace;
      font-size: 0.7rem;
      color: var(--muted);
      text-decoration: none;
      letter-spacing: 0.08em;
      margin-bottom: 20px;
      transition: color 0.2s;
    }
    .back-link:hover { color: var(--accent); }

    .card-title {
      font-size: 1.5rem;
      font-weight: 800;
      letter-spacing: -0.02em;
      line-height: 1.1;
    }

    .card-title span { color: var(--accent); }

    .card-sub {
      margin-top: 6px;
      font-family: 'DM Mono', monospace;
      font-size: 0.72rem;
      color: var(--muted);
      letter-spacing: 0.04em;
    }

    /* Card body */
    .card-body {
      padding: 28px 32px 32px;
    }

    /* Error message */
    .error-msg {
      display: flex;
      align-items: center;
      gap: 10px;
      background: rgba(240, 74, 74, 0.08);
      border: 1px solid rgba(240, 74, 74, 0.25);
      border-radius: 2px;
      padding: 10px 14px;
      margin-bottom: 22px;
      font-family: 'DM Mono', monospace;
      font-size: 0.75rem;
      color: var(--error);
      letter-spacing: 0.03em;
    }

    .error-dot {
      width: 6px; height: 6px;
      background: var(--error);
      border-radius: 50%;
      flex-shrink: 0;
    }

    /* Form groups */
    .form-group {
      margin-bottom: 18px;
    }

    label {
      display: block;
      font-family: 'DM Mono', monospace;
      font-size: 0.68rem;
      letter-spacing: 0.15em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 8px;
    }

    input[type="text"],
    input[type="password"],
    select {
      width: 100%;
      background: var(--surface-2);
      border: 1px solid var(--border-mid);
      border-radius: 2px;
      padding: 11px 14px;
      font-family: 'DM Mono', monospace;
      font-size: 0.85rem;
      color: var(--text);
      outline: none;
      transition: border-color 0.2s, box-shadow 0.2s;
      appearance: none;
      -webkit-appearance: none;
    }

    input[type="text"]:focus,
    input[type="password"]:focus,
    select:focus {
      border-color: var(--accent-dim);
      box-shadow: 0 0 0 3px rgba(200, 240, 74, 0.08);
    }

    input::placeholder { color: var(--muted); }

    /* Select wrapper for custom arrow */
    .select-wrap {
      position: relative;
    }

    .select-wrap::after {
      content: '▾';
      position: absolute;
      right: 14px; top: 50%;
      transform: translateY(-50%);
      color: var(--muted);
      font-size: 0.75rem;
      pointer-events: none;
    }

    select option {
      background: var(--surface-2);
      color: var(--text);
    }

    /* Divider */
    .form-divider {
      height: 1px;
      background: var(--border);
      margin: 22px 0;
    }

    /* Submit button */
    .btn-submit {
      width: 100%;
      padding: 13px;
      background: var(--accent);
      color: var(--bg);
      border: none;
      border-radius: 2px;
      font-family: 'Syne', sans-serif;
      font-weight: 700;
      font-size: 0.85rem;
      letter-spacing: 0.12em;
      text-transform: uppercase;
      cursor: pointer;
      position: relative;
      overflow: hidden;
      transition: color 0.3s, box-shadow 0.3s;
    }

    .btn-submit::before {
      content: '';
      position: absolute;
      inset: 0;
      background: var(--bg);
      transform: translateX(-101%);
      transition: transform 0.35s cubic-bezier(0.77,0,0.18,1);
      z-index: 0;
    }

    .btn-submit:hover::before { transform: translateX(0); }
    .btn-submit:hover {
      color: var(--accent);
      box-shadow: 0 0 24px var(--glow);
    }

    .btn-submit span {
      position: relative;
      z-index: 1;
    }

    /* Footer note */
    .card-footer {
      padding: 14px 32px;
      border-top: 1px solid var(--border);
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .card-footer span {
      font-family: 'DM Mono', monospace;
      font-size: 0.65rem;
      color: var(--muted);
      letter-spacing: 0.08em;
    }

    .status-dot {
      width: 6px; height: 6px;
      background: var(--accent);
      border-radius: 50%;
      display: inline-block;
      margin-right: 6px;
      animation: blink 2s ease-in-out infinite;
    }

    @keyframes blink {
      0%, 100% { opacity: 1; }
      50%       { opacity: 0.3; }
    }

    @keyframes slideUp {
      to { opacity: 1; transform: translateY(0); }
    }

    @keyframes fadeIn {
      to { opacity: 1; }
    }
  </style>
</head>
<body>

  <div class="blob"></div>

  <div class="corner corner-tl">CEMK // AUTH</div>
  <div class="corner corner-tr">v1.0.0</div>
  <div class="corner corner-bl">SECURE LOGIN</div>
  <div class="corner corner-br">EST. 2024</div>

  <div class="page">
    <div class="card">

      <!-- Header -->
      <div class="card-header">
        <a href="index.html" class="back-link">&#8592; Back to Portal</a>
        <h1 class="card-title">Sign <span>In</span></h1>
        <p class="card-sub">// Enter your credentials to continue</p>
      </div>

      <!-- Body -->
      <div class="card-body">

        <!-- Error message (shown on failed login) -->
        <%
          String message = (String) request.getAttribute("message");
          if (message != null) {
        %>
        <div class="error-msg">
          <span class="error-dot"></span>
          <%= message %>
        </div>
        <% } %>

        <form action="LoginServlet" method="post">

          <div class="form-group">
            <label for="user">User ID</label>
            <input type="text" id="user" name="user" placeholder="Enter your user ID" required autocomplete="username">
          </div>

          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="••••••••" required autocomplete="current-password">
          </div>

          <div class="form-group">
            <label for="role">Role</label>
            <div class="select-wrap">
              <select id="role" name="role" required>
                <option value="" disabled selected>Select your role</option>
                <option value="admin">Admin</option>
                <option value="student">Student</option>
                <option value="teacher">Teacher</option>
              </select>
            </div>
          </div>

          <div class="form-divider"></div>

          <button type="submit" class="btn-submit">
            <span>Access Portal &rarr;</span>
          </button>

        </form>
      </div>

      <!-- Footer -->
      <div class="card-footer">
        <span><span class="status-dot"></span>System Online</span>
        <span>CEMK &copy; 2024</span>
      </div>

    </div>
  </div>

</body>
</html>
