<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CEMK — About Us</title>
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
      background-image: linear-gradient(var(--border) 1px,transparent 1px), linear-gradient(90deg,var(--border) 1px,transparent 1px);
      background-size:60px 60px; pointer-events:none; z-index:0; opacity:0.3;
    }
    .page-wrap { position:relative; z-index:1; min-height:100vh; display:flex; flex-direction:column; }
    .main { padding:36px 40px; max-width:1000px; margin:0 auto; width:100%; flex:1; }
    .page-tag { font-family:'DM Mono',monospace; font-size:0.65rem; letter-spacing:0.2em; color:var(--accent); text-transform:uppercase; margin-bottom:10px; }
    .page-title { font-size:clamp(1.6rem,3vw,2.2rem); font-weight:800; letter-spacing:-0.02em; margin-bottom:6px; }
    .page-title span { color:var(--accent); }
    .page-sub { font-family:'DM Mono',monospace; font-size:0.75rem; color:var(--muted); margin-bottom:28px; }
    .content-card {
      background:var(--surface); border:1px solid var(--border-mid); border-radius:3px; padding:28px 30px;
      animation: fadeUp 0.5s ease forwards 0.2s; opacity:0;
    }
    .features-list { list-style:none; display:grid; grid-template-columns: repeat(auto-fill, minmax(280px,1fr)); gap:10px; }
    .features-list li {
      font-family:'DM Mono',monospace; font-size:0.75rem; color:var(--muted); line-height:1.5;
      padding:11px 14px; background:var(--surface-2); border:1px solid var(--border); border-radius:2px;
      display:flex; align-items:flex-start; gap:8px; transition:border-color 0.2s;
    }
    .features-list li:hover { border-color:var(--accent-dim); color:var(--text); }
    .features-list li::before { content:'//'; color:var(--accent); flex-shrink:0; }
    @keyframes fadeUp { from{opacity:0;transform:translateY(14px)} to{opacity:1;transform:translateY(0)} }
  </style>
</head>
<body>
<div class="page-wrap">
  <%@include file="header.jsp"%>
  <%@include file="navbar.jsp"%>

  <main class="main">
    <div class="page-tag">&#9632; About Us</div>
    <h1 class="page-title">Our <span>Legacy</span></h1>
    <p class="page-sub">// What makes CEMK a distinguished institution</p>

    <div class="content-card">
      <ul class="features-list">
        <li>Highly qualified faculty from IITs, NITs and renowned institutes</li>
        <li>C-DAC Regional Centre for 3D Printing &amp; Additive Manufacturing Technology (MeitY, Govt. of India)</li>
        <li>Proactive &amp; Efficient Placement Cell</li>
        <li>Open-Access Library &amp; Book-bank Facility</li>
        <li>Subscriber of Springer Nature, Taylor &amp; Francis, Cambridge University Press and more</li>
        <li>Highly developed Laboratories</li>
        <li>AI &amp; IoT Laboratories</li>
        <li>3D Printer, Robotics &amp; Mechatronics Laboratory</li>
        <li>Library &amp; Laboratory access beyond college hours</li>
        <li>Innovation &amp; Entrepreneur Development Cell</li>
        <li>Start-ups and Incubation Cell</li>
        <li>Scope of R&amp;D under qualified guides</li>
        <li>Nodal centre for IIRS-ISRO online courses</li>
        <li>Students Chapter for NPTEL Courses conducted by IITs</li>
        <li>Strong Alumni network</li>
        <li>Various clubs for self-development</li>
        <li>West Bengal Freeship (WBFS) Scheme</li>
        <li>Separate Boys &amp; Girls Hostels with internet connectivity</li>
        <li>Playground: Football, Cricket, Basketball, Badminton and more</li>
        <li>Gymnasiums for Boys &amp; Girls</li>
        <li>Indoor and Open Air Auditoriums</li>
        <li>Classrooms with modern Audio Visual aids</li>
        <li>Seminar Halls &amp; Conference Room</li>
        <li>Wi-Fi enabled campus</li>
        <li>NCC, NSS &amp; UBA Activities</li>
        <li>Residential Quarters for Teachers &amp; Staff</li>
        <li>Medical Facilities provided by WBPDCL</li>
        <li>ATM &amp; Courier Facility within 1 km</li>
        <li>Good connectivity by Road &amp; Rail</li>
        <li>Sprawling green eco-friendly campus</li>
        <li>MHRD certified SAP institution</li>
      </ul>
    </div>
  </main>

  <%@include file="footer.jsp"%>
</div>
</body>
</html>
