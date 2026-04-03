<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CEMK — All Students</title>
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Mono:wght@300;400&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
    :root {
      --bg:#0b0c10; --surface:#13141a; --surface-2:#1a1b24;
      --border:#1f2130; --border-mid:#2a2d40;
      --accent:#c8f04a; --accent-dim:#8faa2e;
      --text:#e8eaf0; --muted:#5a5e72;
      --danger:#f04a4a; --danger-dim:rgba(240,74,74,0.1);
    }
    html, body { min-height:100%; background:var(--bg); color:var(--text); font-family:'Syne',sans-serif; }
    body::after {
      content:''; position:fixed; inset:0;
      background-image: linear-gradient(var(--border) 1px,transparent 1px),linear-gradient(90deg,var(--border) 1px,transparent 1px);
      background-size:60px 60px; pointer-events:none; z-index:0; opacity:0.3;
    }
    .page-wrap { position:relative; z-index:1; min-height:100vh; display:flex; flex-direction:column; }
    .main { padding:36px 40px; max-width:1100px; margin:0 auto; width:100%; flex:1; }
    .page-tag { font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.2em; color:var(--accent); text-transform:uppercase; margin-bottom:10px; }
    .page-title { font-size:clamp(1.6rem,3vw,2.2rem); font-weight:800; letter-spacing:-0.02em; margin-bottom:6px; }
    .page-title span { color:var(--accent); }
    .page-sub { font-family:'DM Mono',monospace; font-size:0.75rem; color:var(--muted); margin-bottom:28px; }

    .table-card {
      background:var(--surface); border:1px solid var(--border-mid); border-radius:3px; overflow:hidden;
      animation: fadeUp 0.5s ease forwards 0.2s; opacity:0;
    }
    .table-card-header {
      padding:14px 22px; border-bottom:1px solid var(--border);
      display:flex; align-items:center; justify-content:space-between;
    }
    .table-label {
      font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.15em;
      text-transform:uppercase; color:var(--muted);
      display:flex; align-items:center; gap:8px;
    }
    .table-label::before { content:''; display:inline-block; width:8px; height:1px; background:var(--accent); }
    .add-btn {
      font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.1em;
      text-transform:uppercase; color:var(--accent); border:1px solid var(--accent-dim);
      border-radius:2px; padding:5px 12px; text-decoration:none;
      transition:background 0.2s;
    }
    .add-btn:hover { background:rgba(200,240,74,0.08); }

    table { width:100%; border-collapse:collapse; }
    thead tr { border-bottom:1px solid var(--border-mid); }
    th {
      font-family:'DM Mono',monospace; font-size:0.62rem; letter-spacing:0.15em;
      text-transform:uppercase; color:var(--muted); padding:12px 18px;
      text-align:left; font-weight:400;
    }
    tbody tr {
      border-bottom:1px solid var(--border);
      transition:background 0.15s;
    }
    tbody tr:last-child { border-bottom:none; }
    tbody tr:hover { background:var(--surface-2); }
    td {
      font-family:'DM Mono',monospace; font-size:0.75rem; color:var(--text);
      padding:13px 18px;
    }
    td.id-cell { color:var(--accent); }
    .action-link {
      font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.08em;
      text-transform:uppercase; padding:4px 10px; border-radius:2px; text-decoration:none;
      border:1px solid transparent; transition:all 0.2s;
    }
    .action-link.edit {
      color:var(--accent); border-color:rgba(200,240,74,0.2);
    }
    .action-link.edit:hover { background:rgba(200,240,74,0.08); border-color:var(--accent-dim); }
    .action-link.delete {
      color:var(--danger); border-color:rgba(240,74,74,0.2); margin-left:6px;
    }
    .action-link.delete:hover { background:var(--danger-dim); border-color:var(--danger); }
    .empty-row td {
      text-align:center; padding:32px; color:var(--muted);
      font-family:'DM Mono',monospace; font-size:0.75rem;
    }
    @keyframes fadeUp { from{opacity:0;transform:translateY(14px)} to{opacity:1;transform:translateY(0)} }
  </style>
</head>
<body>
<div class="page-wrap">
  <%@include file="header.jsp"%>
  <%@include file="navbar.jsp"%>

  <%@include file="student-data.jsp"%>

  <main class="main">
    <div class="page-tag">&#9632; Students</div>
    <h1 class="page-title">All <span>Students</span></h1>
    <p class="page-sub">// Complete student records in the system</p>

    <div class="table-card">
      <div class="table-card-header">
        <span class="table-label">Student Records</span>
        <a href="register-student.jsp" class="add-btn">+ Add New</a>
      </div>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>City</th>
            <th>Age</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%@include file="body.jsp"%>
        </tbody>
      </table>
    </div>
  </main>

  <%@include file="footer.jsp"%>
</div>
</body>
</html>
