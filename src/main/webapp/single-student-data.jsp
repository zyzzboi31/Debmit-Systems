<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cemk.controller.StudentDTO"%>
<%@page import="com.cemk.controller.StudentService"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CEMK — Student Detail</title>
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
    .main { padding:36px 40px; max-width:560px; margin:0 auto; width:100%; flex:1; }
    .page-tag { font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.2em; color:var(--accent); text-transform:uppercase; margin-bottom:10px; }
    .page-title { font-size:clamp(1.6rem,3vw,2.2rem); font-weight:800; letter-spacing:-0.02em; margin-bottom:6px; }
    .page-title span { color:var(--accent); }
    .page-sub { font-family:'DM Mono',monospace; font-size:0.75rem; color:var(--muted); margin-bottom:28px; }
    .detail-card {
      background:var(--surface); border:1px solid var(--border-mid); border-radius:3px; overflow:hidden;
      animation: fadeUp 0.5s ease forwards 0.2s; opacity:0;
    }
    .detail-card-header {
      padding:16px 22px; border-bottom:1px solid var(--border); position:relative;
      display:flex; align-items:center; gap:14px;
    }
    .detail-card-header::before {
      content:''; position:absolute; top:0; left:0; right:0; height:2px;
      background:linear-gradient(90deg,var(--accent),transparent);
    }
    .detail-avatar {
      width:40px; height:40px; background:rgba(200,240,74,0.08);
      border:1px solid var(--accent-dim); border-radius:2px;
      display:flex; align-items:center; justify-content:center;
      font-family:'DM Mono',monospace; font-size:0.8rem; color:var(--accent);
    }
    .detail-id { font-family:'DM Mono',monospace; font-size:0.7rem; color:var(--muted); margin-top:2px; }
    .detail-name { font-size:1rem; font-weight:700; }
    .detail-row {
      display:flex; align-items:center; justify-content:space-between;
      padding:13px 22px; border-bottom:1px solid var(--border);
    }
    .detail-row:last-child { border-bottom:none; }
    .detail-key { font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.12em; text-transform:uppercase; color:var(--muted); }
    .detail-val { font-family:'DM Mono',monospace; font-size:0.8rem; color:var(--text); }
    .detail-actions { padding:16px 22px; border-top:1px solid var(--border); display:flex; gap:10px; }
    .btn-edit {
      font-family:'DM Mono',monospace; font-size:0.68rem; letter-spacing:0.1em; text-transform:uppercase;
      color:var(--accent); border:1px solid var(--accent-dim); border-radius:2px; padding:7px 16px;
      text-decoration:none; transition:background 0.2s;
    }
    .btn-edit:hover { background:rgba(200,240,74,0.08); }
    .btn-back {
      font-family:'DM Mono',monospace; font-size:0.68rem; letter-spacing:0.1em; text-transform:uppercase;
      color:var(--muted); border:1px solid var(--border-mid); border-radius:2px; padding:7px 16px;
      text-decoration:none; transition:color 0.2s, border-color 0.2s;
    }
    .btn-back:hover { color:var(--text); border-color:var(--text); }
    .not-found {
      padding:40px 22px; text-align:center;
      font-family:'DM Mono',monospace; font-size:0.8rem; color:var(--muted);
    }
    @keyframes fadeUp { from{opacity:0;transform:translateY(14px)} to{opacity:1;transform:translateY(0)} }
  </style>
</head>
<body>
<%
  String sid = request.getParameter("id");
  StudentDTO st = null;
  if (sid != null && !sid.isEmpty()) {
    st = new StudentService().getSingleStudent(sid);
  }
  String initials = (st != null && st.getStudentName() != null && st.getStudentName().length() >= 2)
                    ? st.getStudentName().substring(0,2).toUpperCase() : "??";
%>
<div class="page-wrap">
  <%@include file="header.jsp"%>
  <%@include file="navbar.jsp"%>

  <main class="main">
    <div class="page-tag">&#9632; Students</div>
    <h1 class="page-title">Student <span>Detail</span></h1>
    <p class="page-sub">// Viewing individual student record</p>

    <div class="detail-card">
      <% if (st == null) { %>
        <div class="not-found">// No student found with ID: <%= sid %></div>
      <% } else { %>
        <div class="detail-card-header">
          <div class="detail-avatar"><%= initials %></div>
          <div>
            <div class="detail-name"><%= st.getStudentName() %></div>
            <div class="detail-id">#<%= st.getStudentID() %></div>
          </div>
        </div>
        <div class="detail-row">
          <span class="detail-key">Student ID</span>
          <span class="detail-val" style="color:var(--accent)"><%= st.getStudentID() %></span>
        </div>
        <div class="detail-row">
          <span class="detail-key">Full Name</span>
          <span class="detail-val"><%= st.getStudentName() %></span>
        </div>
        <div class="detail-row">
          <span class="detail-key">Email</span>
          <span class="detail-val"><%= st.getStudentEmail() %></span>
        </div>
        <div class="detail-row">
          <span class="detail-key">City</span>
          <span class="detail-val"><%= st.getStudentCity() %></span>
        </div>
        <div class="detail-row">
          <span class="detail-key">Age</span>
          <span class="detail-val"><%= st.getStudentAge() %></span>
        </div>
        <div class="detail-actions">
          <a href="edit-student.jsp?id=<%= st.getStudentID() %>" class="btn-edit">Edit Record</a>
          <a href="view-all-students.jsp" class="btn-back">&larr; All Students</a>
        </div>
      <% } %>
    </div>
  </main>

  <%@include file="footer.jsp"%>
</div>
</body>
</html>
