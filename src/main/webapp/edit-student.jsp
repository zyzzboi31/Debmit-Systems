<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CEMK — Edit Student</title>
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Mono:wght@300;400&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
    :root {
      --bg:#0b0c10; --surface:#13141a; --surface-2:#1a1b24;
      --border:#1f2130; --border-mid:#2a2d40;
      --accent:#c8f04a; --accent-dim:#8faa2e;
      --text:#e8eaf0; --muted:#5a5e72;
      --glow:rgba(200,240,74,0.12);
    }
    html, body { min-height:100%; background:var(--bg); color:var(--text); font-family:'Syne',sans-serif; }
    body::after {
      content:''; position:fixed; inset:0;
      background-image: linear-gradient(var(--border) 1px,transparent 1px),linear-gradient(90deg,var(--border) 1px,transparent 1px);
      background-size:60px 60px; pointer-events:none; z-index:0; opacity:0.3;
    }
    .page-wrap { position:relative; z-index:1; min-height:100vh; display:flex; flex-direction:column; }
    .main { padding:36px 40px; max-width:560px; margin:0 auto; width:100%; flex:1; }
    .page-tag { font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.2em; color:var(--accent); text-transform:uppercase; margin-bottom:10px; }
    .page-title { font-size:clamp(1.6rem,3vw,2.2rem); font-weight:800; letter-spacing:-0.02em; margin-bottom:6px; }
    .page-title span { color:var(--accent); }
    .page-sub { font-family:'DM Mono',monospace; font-size:0.75rem; color:var(--muted); margin-bottom:28px; }
    .form-card {
      background:var(--surface); border:1px solid var(--border-mid); border-radius:3px; overflow:hidden;
      animation: fadeUp 0.5s ease forwards 0.2s; opacity:0;
    }
    .form-card-header { padding:18px 24px 16px; border-bottom:1px solid var(--border); position:relative; }
    .form-card-header::before {
      content:''; position:absolute; top:0; left:0; right:0; height:2px;
      background:linear-gradient(90deg,var(--accent),transparent);
    }
    .form-card-title { font-size:0.9rem; font-weight:700; letter-spacing:-0.01em; }
    .form-card-body { padding:22px 24px 26px; }
    .form-group { margin-bottom:16px; }
    label {
      display:block; font-family:'DM Mono',monospace; font-size:0.65rem;
      letter-spacing:0.15em; text-transform:uppercase; color:var(--muted); margin-bottom:7px;
    }
    input[type="text"], input[type="number"] {
      width:100%; background:var(--surface-2); border:1px solid var(--border-mid);
      border-radius:2px; padding:10px 13px; font-family:'DM Mono',monospace;
      font-size:0.82rem; color:var(--text); outline:none;
      transition:border-color 0.2s, box-shadow 0.2s;
    }
    input:focus { border-color:var(--accent-dim); box-shadow:0 0 0 3px rgba(200,240,74,0.08); }
    input::placeholder { color:var(--muted); }
    input[readonly] { color:var(--muted); cursor:not-allowed; opacity:0.7; }
    .form-divider { height:1px; background:var(--border); margin:18px 0; }
    .form-actions { display:flex; gap:10px; }
    .btn-primary {
      flex:1; padding:12px; background:var(--accent); color:var(--bg);
      border:none; border-radius:2px; font-family:'Syne',sans-serif; font-weight:700;
      font-size:0.82rem; letter-spacing:0.1em; text-transform:uppercase; cursor:pointer;
      position:relative; overflow:hidden; transition:color 0.3s, box-shadow 0.3s;
    }
    .btn-primary::before {
      content:''; position:absolute; inset:0; background:var(--bg);
      transform:translateX(-101%); transition:transform 0.35s cubic-bezier(0.77,0,0.18,1); z-index:0;
    }
    .btn-primary:hover::before { transform:translateX(0); }
    .btn-primary:hover { color:var(--accent); box-shadow:0 0 20px var(--glow); }
    .btn-primary span { position:relative; z-index:1; }
    .btn-secondary {
      padding:12px 20px; background:transparent; color:var(--muted);
      border:1px solid var(--border-mid); border-radius:2px; font-family:'DM Mono',monospace;
      font-size:0.75rem; letter-spacing:0.08em; text-transform:uppercase; cursor:pointer;
      text-decoration:none; display:flex; align-items:center;
      transition:color 0.2s, border-color 0.2s;
    }
    .btn-secondary:hover { color:var(--text); border-color:var(--text); }
    @keyframes fadeUp { from{opacity:0;transform:translateY(14px)} to{opacity:1;transform:translateY(0)} }
  </style>
</head>
<body>
<div class="page-wrap">
  <%@include file="header.jsp"%>
  <%@include file="navbar.jsp"%>

  <main class="main">
    <div class="page-tag">&#9632; Students</div>
    <h1 class="page-title">Edit <span>Student</span></h1>
    <p class="page-sub">// Update an existing student record</p>

    <div class="form-card">
      <div class="form-card-header">
        <div class="form-card-title">Update Student Data</div>
      </div>
      <div class="form-card-body">
        <%@include file="student-edit-form.jsp"%>
      </div>
    </div>
  </main>

  <%@include file="footer.jsp"%>
</div>
</body>
</html>
