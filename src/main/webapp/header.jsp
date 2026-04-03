<%-- Shared header bar: logo + college name + user greeting + logout --%>
<style>
  .cemk-header {
    position: relative;
    background: rgba(11,12,16,0.95);
    border-bottom: 1px solid #2a2d40;
    padding: 0 32px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 62px;
    z-index: 100;
  }
  .cemk-header::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 2px;
    background: linear-gradient(90deg, #c8f04a, transparent 60%);
  }
  .cemk-header-brand { display: flex; align-items: center; gap: 14px; }
  .cemk-header-logo {
    width: 44px; height: 44px;
    border: 1px solid #2a2d40;
    border-radius: 3px;
    object-fit: contain;
    background: #13141a;
  }
  .cemk-header-logo-placeholder {
    width: 44px; height: 44px;
    border: 1px solid #2a2d40;
    border-radius: 3px;
    background: #13141a;
    display: flex; align-items: center; justify-content: center;
    font-family: 'Syne', sans-serif;
    font-size: 0.75rem;
    font-weight: 800;
    color: #c8f04a;
  }
  .cemk-header-text {}
  .cemk-header-title {
    font-family: 'Syne', sans-serif;
    font-size: 0.95rem;
    font-weight: 800;
    letter-spacing: -0.01em;
    color: #e8eaf0;
    line-height: 1.1;
  }
  .cemk-header-title span { color: #c8f04a; }
  .cemk-header-sub {
    font-family: 'DM Mono', monospace;
    font-size: 0.6rem;
    color: #5a5e72;
    letter-spacing: 0.04em;
    margin-top: 2px;
  }
  .cemk-header-right {
    display: flex; align-items: center; gap: 14px;
  }
  .cemk-header-user {
    font-family: 'DM Mono', monospace;
    font-size: 0.72rem;
    color: #5a5e72;
  }
  .cemk-header-user strong {
    color: #c8f04a;
    font-weight: 400;
  }
  .cemk-header-logout {
    font-family: 'DM Mono', monospace;
    font-size: 0.65rem;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: #5a5e72;
    border: 1px solid #2a2d40;
    border-radius: 2px;
    padding: 5px 12px;
    text-decoration: none;
    transition: color 0.2s, border-color 0.2s;
  }
  .cemk-header-logout:hover { color: #c8f04a; border-color: #8faa2e; }
</style>

<div class="cemk-header">
  <div class="cemk-header-brand">
    <div class="cemk-header-logo-placeholder">CEM<span style="color:#e8eaf0">K</span></div>
    <div class="cemk-header-text">
      <div class="cemk-header-title">College of Engineering &amp; Management, <span>Kolaghat</span></div>
      <div class="cemk-header-sub">Affiliated to MAKAUT &nbsp;|&nbsp; Approved by AICTE &nbsp;|&nbsp; Est. September 1998</div>
    </div>
  </div>
  <div class="cemk-header-right">
    <span class="cemk-header-user">Hello, <strong><%=(String) session.getAttribute("user-id")%></strong></span>
    <a href="logout.jsp" class="cemk-header-logout">Logout</a>
  </div>
</div>
