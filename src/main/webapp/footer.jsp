<%-- Shared footer --%>
<style>
  .cemk-footer {
    border-top: 1px solid #2a2d40;
    padding: 16px 32px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: auto;
  }
  .cemk-footer-text {
    font-family: 'DM Mono', monospace;
    font-size: 0.65rem;
    color: #5a5e72;
    letter-spacing: 0.08em;
  }
  .cemk-footer-text span { color: #c8f04a; }
  .cemk-footer-dot {
    width: 5px; height: 5px;
    background: #c8f04a;
    border-radius: 50%;
    display: inline-block;
    margin-right: 6px;
    animation: footerBlink 2.5s ease-in-out infinite;
  }
  @keyframes footerBlink {
    0%,100% { opacity:1; } 50% { opacity:0.3; }
  }
</style>

<footer class="cemk-footer">
  <span class="cemk-footer-text">&copy; <span>CEM Kolaghat</span>. All Rights Reserved.</span>
  <span class="cemk-footer-text"><span class="cemk-footer-dot"></span>System Online &nbsp;&mdash;&nbsp; CEMK v1.0.0</span>
</footer>
