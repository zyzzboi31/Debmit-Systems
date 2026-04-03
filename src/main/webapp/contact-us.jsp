<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CEMK — Contact Us</title>
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Mono:wght@300;400&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
    :root {
      --bg:#0b0c10; --surface:#13141a; --surface-2:#1a1b24;
      --border:#1f2130; --border-mid:#2a2d40;
      --accent:#c8f04a; --accent-dim:#8faa2e;
      --text:#e8eaf0; --muted:#5a5e72;
    }
    html, body { min-height:100%; background:var(--bg); color:var(--text); font-family:'Syne',sans-serif; }
    body::after {
      content:''; position:fixed; inset:0;
      background-image: linear-gradient(var(--border) 1px,transparent 1px),linear-gradient(90deg,var(--border) 1px,transparent 1px);
      background-size:60px 60px; pointer-events:none; z-index:0; opacity:0.3;
    }
    .page-wrap { position:relative; z-index:1; min-height:100vh; display:flex; flex-direction:column; }
    .main { padding:36px 40px; max-width:700px; margin:0 auto; width:100%; flex:1; }
    .page-tag { font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.2em; color:var(--accent); text-transform:uppercase; margin-bottom:10px; }
    .page-title { font-size:clamp(1.6rem,3vw,2.2rem); font-weight:800; letter-spacing:-0.02em; margin-bottom:6px; }
    .page-title span { color:var(--accent); }
    .page-sub { font-family:'DM Mono',monospace; font-size:0.75rem; color:var(--muted); margin-bottom:28px; }
    .contact-card {
      background:var(--surface); border:1px solid var(--border-mid); border-radius:3px; overflow:hidden;
      animation: fadeUp 0.5s ease forwards 0.2s; opacity:0;
    }
    .contact-row {
      display:flex; align-items:center; gap:16px;
      padding:16px 24px; border-bottom:1px solid var(--border);
    }
    .contact-row:last-child { border-bottom:none; }
    .contact-icon {
      font-family:'DM Mono',monospace; font-size:0.7rem; color:var(--accent);
      width:28px; flex-shrink:0; text-align:center;
    }
    .contact-label {
      font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.12em;
      text-transform:uppercase; color:var(--muted); width:80px; flex-shrink:0;
    }
    .contact-value {
      font-family:'DM Mono',monospace; font-size:0.8rem; color:var(--text);
    }
    .contact-value a { color:var(--accent); text-decoration:none; }
    .contact-value a:hover { text-decoration:underline; }
    @keyframes fadeUp { from{opacity:0;transform:translateY(14px)} to{opacity:1;transform:translateY(0)} }
  </style>
</head>
<body>
<div class="page-wrap">
  <%@include file="header.jsp"%>
  <%@include file="navbar.jsp"%>

  <main class="main">
    <div class="page-tag">&#9632; Contact Us</div>
    <h1 class="page-title">Get in <span>Touch</span></h1>
    <p class="page-sub">// Reach out to CEM Kolaghat</p>

    <div class="contact-card">
      <div class="contact-row">
        <span class="contact-icon">[&#9679;]</span>
        <span class="contact-label">Address</span>
        <span class="contact-value">P.O. KTPP Township, Purba Medinipur, Pin: 721171, West Bengal</span>
      </div>
      <div class="contact-row">
        <span class="contact-icon">[&#9742;]</span>
        <span class="contact-label">Phone</span>
        <span class="contact-value">+91 8617653058</span>
      </div>
      <div class="contact-row">
        <span class="contact-icon">[&#9993;]</span>
        <span class="contact-label">Admissions</span>
        <span class="contact-value">9609064108 &nbsp;|&nbsp; 033 6902 9851</span>
      </div>
      <div class="contact-row">
        <span class="contact-icon">[@]</span>
        <span class="contact-label">Email</span>
        <span class="contact-value"><a href="mailto:director@cemk.ac.in">director@cemk.ac.in</a></span>
      </div>
    </div>
  </main>

  <%@include file="footer.jsp"%>
</div>
</body>
</html>
