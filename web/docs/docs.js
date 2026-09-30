(function docsClient() {
  var q = document.getElementById("docsQ"), r = document.getElementById("docsR"), cnt = document.getElementById("docsCount"), idx = null, act = -1;
  // ---- search
  function load() { if (idx) return Promise.resolve(idx); return fetch("search-docs.json").then(function (x) { return x.json(); }).then(function (d) { idx = d; return d; }).catch(function () { idx = []; return idx; }); }
  function items() { return r ? Array.prototype.slice.call(r.querySelectorAll("a")) : []; }
  function mark(i) {
    var a = items(); act = a.length ? (i + a.length) % a.length : -1;
    a.forEach(function (el, j) { el.setAttribute("aria-selected", j === act ? "true" : "false"); if (j === act) el.scrollIntoView({ block: "nearest" }); });
    if (act >= 0) q.setAttribute("aria-activedescendant", a[act].id); else q.removeAttribute("aria-activedescendant");
  }
  function closeR() { if (!r) return; r.replaceChildren(); act = -1; q.setAttribute("aria-expanded", "false"); q.removeAttribute("aria-activedescendant"); }
  function run() {
    var s = q.value.trim().toLowerCase();
    if (!s) { closeR(); if (cnt) cnt.textContent = ""; return; }
    load().then(function (d) {
      if (q.value.trim().toLowerCase() !== s) return;
      var words = s.split(/\s+/), scored = [];
      d.forEach(function (e) {
        var t = e.t.toLowerCase(), rest = ((e.d || "") + " " + (e.g || "") + " " + (e.x || "")).toLowerCase(), sc = 0;
        for (var i = 0; i < words.length; i++) {
          var w = words[i];
          if (t.indexOf(w) === 0) sc += 6; else if (t.indexOf(w) >= 0) sc += 4; else if (rest.indexOf(w) >= 0) sc += 1; else return;
        }
        if (t === s) sc += 10;
        if (e.h.indexOf("#") < 0) sc += 1; // a whole page above one of its sections
        scored.push([sc, e]);
      });
      scored.sort(function (a, b) { return b[0] - a[0]; });
      var out = scored.slice(0, 12).map(function (x) { return x[1]; });
      r.replaceChildren();
      out.forEach(function (e, i) {
        var a = document.createElement("a"); a.href = "../" + e.h; a.id = "docsR-" + i; a.setAttribute("role", "option"); a.setAttribute("aria-selected", "false"); a.textContent = e.t;
        var sm = document.createElement("small"); sm.textContent = e.d || ""; a.appendChild(sm); r.appendChild(a);
      });
      if (!out.length) { var p = document.createElement("small"); p.textContent = "No match in the docs."; r.appendChild(p); }
      q.setAttribute("aria-expanded", out.length ? "true" : "false"); act = -1;
      if (cnt) cnt.textContent = scored.length ? (scored.length > 12 ? "12 of " + scored.length + " results shown" : scored.length + (scored.length === 1 ? " result" : " results")) : "No results";
    });
  }
  if (q && r) {
    q.addEventListener("input", run);
    q.addEventListener("keydown", function (e) {
      if (e.key === "ArrowDown") { e.preventDefault(); if (!items().length) run(); else mark(act + 1); }
      else if (e.key === "ArrowUp") { e.preventDefault(); mark(act - 1); }
      else if (e.key === "Enter") { var a = items(); var t = a[act >= 0 ? act : 0]; if (t) { e.preventDefault(); location.href = t.href; } }
      else if (e.key === "Escape") { if (q.value || items().length) { e.stopPropagation(); q.value = ""; closeR(); if (cnt) cnt.textContent = ""; } }
    });
    document.addEventListener("keydown", function (e) {
      if (e.key !== "/" || e.metaKey || e.ctrlKey || e.altKey) return;
      var el = document.activeElement, tag = el && el.tagName;
      if (tag === "INPUT" || tag === "TEXTAREA" || tag === "SELECT" || (el && el.isContentEditable)) return;
      var pal = document.getElementById("palette"); if (pal && !pal.hidden) return;
      e.preventDefault(); q.focus(); q.select();
    });
    document.addEventListener("click", function (e) { if (!e.target.closest(".docs-search")) closeR(); });
  }
  // ---- copy button on each code block (the site's own copy helper: data-copy-from + toast)
  Array.prototype.forEach.call(document.querySelectorAll(".prose pre"), function (pre, i) {
    var code = pre.querySelector("code"); if (!code) return;
    if (!code.id) code.id = "docs-code-" + i;
    var b = document.createElement("button"); b.type = "button"; b.className = "docs-copy"; b.setAttribute("data-copy-from", code.id);
    b.setAttribute("aria-label", "Copy this code"); b.textContent = "Copy"; pre.appendChild(b);
  });
  // ---- "On this page": mark the section in view
  var toc = document.querySelector(".docs-toc");
  if (toc && "IntersectionObserver" in window) {
    var links = {}, heads = [];
    Array.prototype.forEach.call(toc.querySelectorAll("a[href^='#']"), function (a) {
      var id = decodeURIComponent(a.getAttribute("href").slice(1)), h = document.getElementById(id);
      if (h) { links[id] = a; heads.push(h); }
    });
    var vis = new Set(), cur = null;
    function set(id) {
      if (id === cur) return; cur = id;
      Object.keys(links).forEach(function (k) { if (k === id) links[k].setAttribute("aria-current", "location"); else links[k].removeAttribute("aria-current"); });
      var a = links[id]; if (a && toc.scrollHeight > toc.clientHeight) { var top = a.offsetTop - toc.clientHeight / 2; toc.scrollTop = Math.max(0, top); }
    }
    var io = new IntersectionObserver(function (es) {
      es.forEach(function (en) { if (en.isIntersecting) vis.add(en.target); else vis.delete(en.target); });
      var first = null;
      if (vis.size) { heads.forEach(function (h) { if (!first && vis.has(h)) first = h; }); }
      else { heads.forEach(function (h) { if (h.getBoundingClientRect().top < 120) first = h; }); }
      if (first) set(first.id);
    }, { rootMargin: "-88px 0px -55% 0px" });
    heads.forEach(function (h) { io.observe(h); });
  }
  // ---- page list: open on wide screens, folded on phones (the reader opens it from the top)
  var d = document.querySelector(".docs-nav-d");
  if (d && window.matchMedia) {
    var mq = window.matchMedia("(max-width: 820px)");
    var sync = function () { if (mq.matches) d.removeAttribute("open"); else d.setAttribute("open", ""); };
    sync(); if (mq.addEventListener) mq.addEventListener("change", sync);
  }
})();
