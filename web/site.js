/* Kshana site: behaviour shared by every page (theme, nav, menu, copy, palette, tabs, installer).
   Page-specific modules live in js/*.mjs. Everything here works without storage; storage only
   remembers a viewer's theme and installer tab. */
(function () {
  "use strict";
  var ROOT = (window.KSITE && window.KSITE.root) || "";
  var $ = function (s, r) { return (r || document).querySelector(s); };
  var $$ = function (s, r) { return Array.prototype.slice.call((r || document).querySelectorAll(s)); };
  var store = {
    get: function (k) { try { return localStorage.getItem(k); } catch (e) { return null; } },
    set: function (k, v) { try { localStorage.setItem(k, v); } catch (e) {} }
  };

  /* ---------- theme ---------- */
  var root = document.documentElement;
  root.classList.add("js");
  function effTheme() { return root.getAttribute("data-theme") || (matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"); }
  var themeBtn = $("#themeBtn");
  if (themeBtn) themeBtn.addEventListener("click", function () {
    var n = effTheme() === "dark" ? "light" : "dark";
    root.setAttribute("data-theme", n);
    store.set("kshana-theme", n);
    document.dispatchEvent(new CustomEvent("ks-theme"));
  });

  /* ---------- toast + copy ---------- */
  var toastEl = $("#toast"), toastT;
  function toast(m) { if (!toastEl) return; toastEl.textContent = m; toastEl.classList.add("on"); clearTimeout(toastT); toastT = setTimeout(function () { toastEl.classList.remove("on"); }, 1900); }
  window.KStoast = toast;
  function copyText(text, btn) {
    var done = function () { if (btn) { btn.classList.add("copied"); setTimeout(function () { btn.classList.remove("copied"); }, 1400); } toast("Copied: " + (text.length > 60 ? text.slice(0, 57) + "…" : text)); };
    if (navigator.clipboard && navigator.clipboard.writeText) navigator.clipboard.writeText(text).then(done, function () { fallback(text); done(); });
    else { fallback(text); done(); }
  }
  function fallback(text) { var t = document.createElement("textarea"); t.value = text; t.setAttribute("readonly", ""); t.style.cssText = "position:fixed;opacity:0"; document.body.appendChild(t); t.select(); try { document.execCommand("copy"); } catch (e) {} t.remove(); }
  document.addEventListener("click", function (e) {
    var b = e.target.closest("[data-copy]");
    if (b) { copyText(b.getAttribute("data-copy"), b); return; }
    var f = e.target.closest("[data-copy-from]");
    if (f) { var src = document.getElementById(f.getAttribute("data-copy-from")); if (src) copyText(src.textContent, f); }
  });

  /* ---------- nav: tone over dark sections, mobile menu ---------- */
  var nav = $("#nav"), darkSecs = $$("[data-nav-dark]");
  function navTone() {
    if (!nav) return;
    var y = 30, dark = false;
    for (var i = 0; i < darkSecs.length; i++) { var r = darkSecs[i].getBoundingClientRect(); if (r.top <= y && r.bottom > y) { dark = true; break; } }
    nav.classList.toggle("on-dark", dark);
    nav.classList.toggle("scrolled", scrollY > 8);
  }
  var tick = false;
  addEventListener("scroll", function () { if (tick) return; tick = true; requestAnimationFrame(function () { tick = false; navTone(); }); }, { passive: true });
  navTone();
  var menuBtn = $("#menuBtn"), links = $("#navLinks");
  if (menuBtn && links) {
    menuBtn.addEventListener("click", function () {
      var open = !links.classList.contains("open");
      links.classList.toggle("open", open);
      menuBtn.setAttribute("aria-expanded", open ? "true" : "false");
      menuBtn.setAttribute("aria-label", open ? "Close the menu" : "Open the menu");
    });
    links.addEventListener("click", function (e) { if (e.target.closest("a")) { links.classList.remove("open"); menuBtn.setAttribute("aria-expanded", "false"); } });
  }
  /* nav row that does not fit (text-only zoom, a larger default font): fold the links into the menu
     (.compact), then drop the search label (.tight), instead of pushing the controls past the edge */
  var navIn = nav && $(".nav-in", nav), navRight = nav && $(".nav-right", nav);
  function navFit() {
    if (!navIn || !navRight) return;
    var over = function () { var b = navIn.getBoundingClientRect(), pr = parseFloat(getComputedStyle(navIn).paddingRight) || 0; return navRight.getBoundingClientRect().right > Math.min(b.right - pr, document.documentElement.clientWidth) + 1; };
    nav.classList.remove("compact", "tight");
    if (over()) { nav.classList.add("compact"); if (over()) nav.classList.add("tight"); }
    if (!nav.classList.contains("compact") && links && links.classList.contains("open") && getComputedStyle(menuBtn).display === "none") { links.classList.remove("open"); menuBtn.setAttribute("aria-expanded", "false"); }
  }
  navFit();
  // re-check when the bar's width changes or its text size does (the wordmark is never hidden by .tight)
  if (nav && "ResizeObserver" in window) { var ro = new ResizeObserver(navFit); ro.observe(nav); var bt = $(".brand-t", nav); if (bt) ro.observe(bt); }
  else addEventListener("resize", navFit);
  if (document.fonts && document.fonts.ready) document.fonts.ready.then(navFit);

  /* A fast scroll (a flick, the End key, a jump link) can carry an element through the window
     between two intersection samples, and it would then stay hidden above the reader. After each
     scroll settles, anything whose top has reached the window is revealed. */
  function revealFallback(nodes, cls) {
    var pend = nodes.slice(), q = 0;
    var sweep = function () {
      q = 0;
      var vh = innerHeight;
      pend = pend.filter(function (n) {
        if (n.classList.contains(cls)) return false;
        if (n.getBoundingClientRect().top < vh) { n.classList.add(cls); return false; }
        return true;
      });
      if (!pend.length) removeEventListener("scroll", onScroll);
    };
    var onScroll = function () { if (!q) q = setTimeout(sweep, 120); };
    addEventListener("scroll", onScroll, { passive: true });
  }

  /* ---------- reveal on scroll (.rv): here, not in a page module, so a module that fails to load
     never leaves content hidden. Reduced motion shows everything at once. */
  var rvs = $$(".rv");
  if (!("IntersectionObserver" in window) || matchMedia("(prefers-reduced-motion: reduce)").matches) rvs.forEach(function (n) { n.classList.add("in"); });
  else {
    var rio = new IntersectionObserver(function (es) { es.forEach(function (e) { if (e.isIntersecting) { e.target.classList.add("in"); rio.unobserve(e.target); } }); }, { threshold: 0.12 });
    rvs.forEach(function (n) { rio.observe(n); });
    revealFallback(rvs, "in");
  }

  /* ---------- tab lists (sectors, bands, installer): roving focus, hash, storage ---------- */
  function initTabs(list, opts) {
    var tabs = $$('[role="tab"]', list);
    function select(tab, focus) {
      tabs.forEach(function (t) {
        var on = t === tab;
        t.setAttribute("aria-selected", on ? "true" : "false");
        t.tabIndex = on ? 0 : -1;
        var p = document.getElementById(t.getAttribute("aria-controls"));
        if (p) p.hidden = !on;
      });
      if (focus) tab.focus();
      if (opts && opts.onSelect) opts.onSelect(tab);
    }
    tabs.forEach(function (t, i) {
      t.addEventListener("click", function () { select(t, false); });
      t.addEventListener("keydown", function (e) {
        var k = e.key, j = null;
        if (k === "ArrowRight" || k === "ArrowDown") j = (i + 1) % tabs.length;
        else if (k === "ArrowLeft" || k === "ArrowUp") j = (i - 1 + tabs.length) % tabs.length;
        else if (k === "Home") j = 0; else if (k === "End") j = tabs.length - 1;
        if (j !== null) { e.preventDefault(); select(tabs[j], true); }
      });
    });
    return { select: select, tabs: tabs };
  }
  window.KStabs = initTabs;

  /* ---------- anchor keeper: a link to #x lands x just under the header, and keeps it there ----------
     Charts, globes and tables that draw after the jump change the height of what sits above the
     target, so a single scroll lands short or long. keep(el) puts el at the top (the header offset
     comes from html{scroll-padding-top}) and re-aligns it on every frame in which it has moved,
     until the layout has been still for a second (at most 6 s), or at once when the reader scrolls,
     clicks, touches or types. Every hash jump on every page goes through here: the page's first
     load with a hash, hashchange, and a click on a link to the hash already in the address bar. */
  var keepRun = 0;
  function targetOf(hash) {
    var id; try { id = decodeURIComponent((hash || "").replace(/^#/, "")); } catch (e) { id = (hash || "").slice(1); }
    return id ? document.getElementById(id) : null;
  }
  function keep(el) {
    if (!el) return;
    // a target inside a closed <details> (the README's folded sections) cannot be scrolled to: open it
    for (var d = el.closest("details:not([open])"); d; d = d.parentElement && d.parentElement.closest("details:not([open])")) d.open = true;
    var run = ++keepRun, t0 = performance.now(), still = t0, last = null;
    var align = function () { el.scrollIntoView({ block: "start", behavior: "instant" }); last = Math.round(el.getBoundingClientRect().top); };
    var stop = function () { if (run === keepRun) keepRun++; off(); };
    var evs = ["wheel", "touchstart", "keydown", "mousedown"];
    var off = function () { evs.forEach(function (n) { removeEventListener(n, stop, true); }); };
    evs.forEach(function (n) { addEventListener(n, stop, { capture: true, passive: true }); });
    align();
    (function tick() {
      if (run !== keepRun) return;
      var now = performance.now();
      var top = Math.round(el.getBoundingClientRect().top);
      if (Math.abs(top - last) > 1) { align(); still = now; }
      if (now - still > 1000 || now - t0 > 6000) { stop(); return; }
      requestAnimationFrame(tick);
    })();
  }
  window.KSkeep = keep;
  // A page module that opens a tab for a hash (the consoles on Capabilities and Editions) selects the
  // tab in its own hashchange listener and calls KSkeep on the anchor; this runs after it, on the same
  // (now shown) element, so the two agree.
  var moved = false;
  ["wheel", "touchstart", "keydown", "mousedown"].forEach(function (n) { addEventListener(n, function () { moved = true; }, { capture: true, passive: true, once: true }); });
  function keepHash() { keep(targetOf(location.hash)); }
  if ("scrollRestoration" in history && location.hash) history.scrollRestoration = "manual";
  addEventListener("hashchange", function () { setTimeout(keepHash, 0); });
  document.addEventListener("click", function (e) {
    var a = e.target.closest && e.target.closest('a[href*="#"]');
    if (!a || e.defaultPrevented || e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return;
    if (a.pathname !== location.pathname || a.host !== location.host || a.hash.length < 2 || a.hash !== location.hash) return;
    // the hash is already in the address bar, so no hashchange will fire: keep it here
    var el = targetOf(a.hash); if (el) { e.preventDefault(); setTimeout(function () { keep(el); }, 0); }
  });
  if (location.hash) {
    keepHash();
    // once images, fonts and deferred modules have loaded, align again, unless the reader has moved on
    addEventListener("load", function () { if (!moved) keepHash(); }, { once: true });
  }

  // Sectors: a link to #defence (etc.) opens that sector and lands its panel just under the header.
  // The id is the panel's (id="defence"); the tab is "st-defence". Selecting a tab keeps the URL in step.
  var sectorList = $(".sectors");
  if (sectorList) {
    var st = initTabs(sectorList, { onSelect: function (t) { var id = t.getAttribute("data-sector"); if (id && location.hash !== "#" + id) history.replaceState(null, "", "#" + id); } });
    var pickHash = function () {
      var h = location.hash.slice(1); var t = st.tabs.filter(function (x) { return x.getAttribute("data-sector") === h; })[0];
      if (t) { st.select(t, false); keep(document.getElementById(h)); }
    };
    pickHash(); addEventListener("hashchange", pickHash);
  }
  // Band atlas: the chips are tabs, and every mark on the frequency map selects its band.
  $$(".ba-chips").forEach(function (l) {
    var bt = initTabs(l);
    var box = l.parentElement;
    $$(".bm[data-band]", box).forEach(function (g) {
      g.addEventListener("click", function () {
        var t = document.getElementById(g.getAttribute("data-band"));
        if (t) { bt.select(t, true); }
      });
    });
  });
  // Any other generated tab set (ways to use it, ...): [data-ks-tabs] wraps one role="tablist".
  $$("[data-ks-tabs]").forEach(function (w) { var l = $('[role="tablist"]', w); if (l) initTabs(l); });

  // Installer: tabs, latest/pinned, remembered per viewer.
  $$("[data-installer]").forEach(function (box) {
    var list = $(".inst-tabs", box);
    var it = initTabs(list, { onSelect: function (t) { store.set("kshana-install-tab", t.getAttribute("data-ch")); } });
    var saved = store.get("kshana-install-tab");
    var hit = it.tabs.filter(function (t) { return t.getAttribute("data-ch") === saved; })[0];
    if (hit) it.select(hit, false);
    function setPin(mode) {
      $$(".pin-toggle button", box).forEach(function (b) { b.setAttribute("aria-pressed", b.getAttribute("data-pin") === mode ? "true" : "false"); });
      $$(".ip-cmd[data-latest]", box).forEach(function (c) {
        var cmd = c.getAttribute(mode === "pinned" ? "data-pinned" : "data-latest");
        var btn = $("button[data-copy]", c); if (!btn) return;
        btn.setAttribute("data-copy", cmd); btn.setAttribute("aria-label", "Copy: " + cmd);
        var t = $(".cmd-t", btn); if (t) t.textContent = cmd;
      });
      store.set("kshana-install-pin", mode);
    }
    $$(".pin-toggle button", box).forEach(function (b) { b.addEventListener("click", function () { setPin(b.getAttribute("data-pin")); }); });
    if (store.get("kshana-install-pin") === "pinned") setPin("pinned");
  });

  /* ---------- filter lists: [data-flist] (ledger, capability explorer, atlas, standards) ----------
     Inside the container: input[data-fl-q]; facet groups [data-fl-key] of buttons[data-v];
     buttons [data-fl-set=key][data-v] elsewhere that set the same facet; items [data-fl-item]
     with data-q (lower-case text) and one data-<key> per facet; groups [data-fl-grp] hide when
     empty; [data-fl-count], [data-fl-empty], and [data-fl-more] when data-fl-limit is set. */
  $$("[data-flist]").forEach(function (box) {
    var items = $$("[data-fl-item]", box), grps = $$("[data-fl-grp]", box).reverse();
    var q = $("[data-fl-q]", box), count = $("[data-fl-count]", box), empty = $("[data-fl-empty]", box), more = $("[data-fl-more]", box);
    var limit = parseInt(box.getAttribute("data-fl-limit") || "0", 10), expanded = false, facets = {};
    /* [data-fl-scroll]: every item is rendered in a fixed-height region [data-fl-region]; the count
       reads "N of M" or "3 matches", edges fade while there is more, an opened row scrolls into view. */
    var region = box.hasAttribute("data-fl-scroll") ? $("[data-fl-region]", box) : null, rLabel = region && region.getAttribute("aria-label");
    var smooth = function () { return !matchMedia("(prefers-reduced-motion: reduce)").matches; };
    function edges() {
      if (!region) return;
      region.classList.toggle("fl-more-up", region.scrollTop > 2);
      region.classList.toggle("fl-more-down", region.scrollTop + region.clientHeight < region.scrollHeight - 2);
    }
    function apply() {
      var s = q ? q.value.trim().toLowerCase() : "", n = 0, active = !!s;
      Object.keys(facets).forEach(function (k) { if (facets[k]) active = true; });
      items.forEach(function (it) {
        var hit = (!s || (it.getAttribute("data-q") || it.textContent.toLowerCase()).indexOf(s) >= 0);
        Object.keys(facets).forEach(function (k) { if (facets[k] && it.getAttribute("data-" + k) !== facets[k]) hit = false; });
        if (hit) n++;
        it.hidden = !hit || (limit && !active && !expanded && n > limit);
      });
      grps.forEach(function (g) { g.hidden = !$$("[data-fl-item]", g).some(function (x) { return !x.hidden; }); });
      if (count) count.textContent = region ? (s ? n + (n === 1 ? " match" : " matches") : (active ? n + " of " : "") + items.length + (active ? "" : " rows"))
        : (active ? n + " of " : "") + items.length + (active ? "" : " in all");
      if (region) {
        region.setAttribute("aria-label", rLabel.replace(/\d+ rows/, (active ? n + " of " + items.length : items.length) + " rows"));
        region.scrollTop = 0; edges();
      }
      if (empty) empty.hidden = n > 0;
      if (more) more.hidden = !limit || active || expanded || items.length <= limit;
    }
    function setFacet(k, v) {
      facets[k] = v || "";
      $$('[data-fl-key="' + k + '"] button, [data-fl-set="' + k + '"]', box).forEach(function (b) { b.setAttribute("aria-pressed", (b.getAttribute("data-v") || "") === facets[k] && (facets[k] || b.closest("[data-fl-key]")) ? "true" : "false"); });
      apply();
    }
    $$("[data-fl-key]", box).forEach(function (g) {
      var k = g.getAttribute("data-fl-key"); facets[k] = "";
      g.addEventListener("click", function (e) { var b = e.target.closest("button"); if (b) setFacet(k, b.getAttribute("data-v")); });
    });
    $$("[data-fl-set]", box).forEach(function (b) {
      var k = b.getAttribute("data-fl-set"); if (!(k in facets)) facets[k] = "";
      b.addEventListener("click", function () { setFacet(k, facets[k] === b.getAttribute("data-v") ? "" : b.getAttribute("data-v")); });
    });
    if (q) q.addEventListener("input", apply);
    if (more) more.addEventListener("click", function () { expanded = true; apply(); });
    if (region) {
      region.addEventListener("scroll", edges, { passive: true });
      window.addEventListener("resize", edges);
      region.addEventListener("toggle", function (e) {
        var d = e.target; if (!d.open) { edges(); return; }
        var rr = region.getBoundingClientRect(), dr = d.getBoundingClientRect(), top = region.scrollTop;
        if (dr.bottom > rr.bottom) top += Math.min(dr.bottom - rr.bottom + 8, dr.top - rr.top);
        else if (dr.top < rr.top) top -= rr.top - dr.top;
        if (top !== region.scrollTop) region.scrollTo({ top: top, behavior: smooth() ? "smooth" : "auto" });
        edges();
      }, true);
    }
    apply();
  });

  /* ---------- exports: every chart's SVG, every chart's and table's data as CSV ---------- */
  function download(name, type, text) {
    var a = document.createElement("a");
    a.href = URL.createObjectURL(new Blob([text], { type: type }));
    a.download = name; document.body.appendChild(a); a.click();
    setTimeout(function () { URL.revokeObjectURL(a.href); a.remove(); }, 500);
  }
  var cssv = getComputedStyle(document.documentElement);
  function resolved(svg) {
    // A downloaded chart keeps its colours: CSS variables and the site's chart classes are inlined.
    var c = svg.cloneNode(true), live = $$("*", svg), copy = $$("*", c);
    ["fill", "stroke", "stroke-width", "stroke-dasharray", "opacity", "font-family", "font-size"].forEach(function (p) {
      live.forEach(function (el, i) { var v = getComputedStyle(el).getPropertyValue(p); if (v) copy[i].style.setProperty(p, v); });
    });
    c.setAttribute("xmlns", "http://www.w3.org/2000/svg");
    return new XMLSerializer().serializeToString(c).replace(/var\((--[\w-]+)\)/g, function (m, n) { return cssv.getPropertyValue(n).trim() || m; });
  }
  var seriesP = null;
  function series() { if (!seriesP) seriesP = fetch(ROOT + "data/series.json").then(function (r) { return r.json(); }); return seriesP; }
  function csvCell(v) { v = v == null ? "" : String(v); return /[",\n#]/.test(v) ? '"' + v.replace(/"/g, '""') + '"' : v; }
  function tableCsv(t) { return $$("tr", t).map(function (r) { return $$("th,td", r).map(function (c) { return csvCell(c.textContent.trim()); }).join(","); }).join("\n"); }
  document.addEventListener("click", function (e) {
    var sv = e.target.closest("[data-dl-svg]");
    if (sv) {
      var fig = sv.closest("figure"), svg = fig && $(".viz-plot svg", fig);
      if (svg) { download((fig.getAttribute("data-viz") || "chart") + (fig.getAttribute("data-variant") ? "-" + fig.getAttribute("data-variant") : "") + ".svg", "image/svg+xml", resolved(svg)); toast("Chart saved as SVG"); }
      return;
    }
    var cv = e.target.closest("[data-dl-csv]");
    if (cv) {
      var id = cv.getAttribute("data-dl-csv"), prev = cv.closest(".prov") && cv.closest(".prov").previousElementSibling;
      if (prev && prev.tagName === "TABLE") { download(id + ".csv", "text/csv", tableCsv(prev)); toast("Table saved as CSV"); return; }
      series().then(function (d) {
        var x = d[id]; if (!x) { toast("No data for this chart"); return; }
        download(x.file, "text/csv", x.head.join("\n") + "\n" + x.rows.map(function (r) { return r.map(csvCell).join(","); }).join("\n") + "\n");
        toast("Data saved as CSV");
      }, function () { toast("The data file could not be loaded"); });
    }
  });

  /* ---------- draw real series in when they scroll into view (never with reduced motion) ---------- */
  var RM = matchMedia("(prefers-reduced-motion: reduce)").matches;
  var anim = $$("[data-anim]");
  if (anim.length && !RM && "IntersectionObserver" in window) {
    anim.forEach(function (a) { a.classList.add("anim-ready"); });
    var io = new IntersectionObserver(function (es) {
      es.forEach(function (en) { if (en.isIntersecting) { en.target.classList.add("anim-in"); io.unobserve(en.target); } });
    }, { rootMargin: "0px 0px -12% 0px" });
    anim.forEach(function (a) { io.observe(a); });
    revealFallback(anim, "anim-in");
  }

  /* ---------- command palette ---------- */
  var pal = $("#palette"), inp = $("#palInput"), list = $("#palList"), count = $("#palCount");
  var items = null, shown = [], act = 0, lastFocus = null;
  var ACTIONS = [
    { t: "Launch " + ((window.KSITE && window.KSITE.studio) || "Kshana Studio"), h: "/playground/", k: "Action" },
    { t: "Switch light or dark theme", a: function () { themeBtn && themeBtn.click(); }, k: "Action" },
    { t: "Copy: cargo install kshana", a: function () { copyText("cargo install kshana"); }, k: "Action" },
    { t: "Request a Kshana Pro evaluation", h: "mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation", k: "Action" },
    { t: "Talk to us about a commercial licence", h: "mailto:contact@ashforde.org?subject=Kshana%20commercial%20licence", k: "Action" },
    { t: "Request a study", h: "mailto:contact@ashforde.org?subject=Kshana%20study%20request", k: "Action" }
  ];
  function load() {
    if (items) return Promise.resolve(items);
    return fetch(ROOT + "data/search.json").then(function (r) { return r.json(); }).then(function (d) { items = ACTIONS.concat(d); return items; })
      .catch(function () { items = ACTIONS.slice(); return items; });
  }
  function fuzzy(q, s) {
    var t = s.toLowerCase(), qi = 0, score = 0, prev = -2;
    for (var i = 0; i < t.length && qi < q.length; i++) {
      if (t[i] === q[qi]) { score += (i === prev + 1 ? 3 : 1) + (i === 0 || /[-\s:.\/]/.test(t[i - 1]) ? 2 : 0); prev = i; qi++; }
    }
    return qi === q.length ? score : -1;
  }
  function render() {
    var q = inp.value.trim().toLowerCase();
    var scored = [];
    (items || ACTIONS).forEach(function (it) {
      if (!q) { if (it.k === "Action" || it.k === "Section") scored.push([0, it]); return; }
      var s = fuzzy(q.replace(/\s+/g, ""), (it.t + " " + (it.d || "")).replace(/\s+/g, ""));
      if (it.t.toLowerCase().indexOf(q) >= 0) s += 40;
      if (s > 0) scored.push([s, it]);
    });
    scored.sort(function (a, b) { return b[0] - a[0]; });
    shown = scored.slice(0, 60).map(function (x) { return x[1]; });
    act = Math.min(act, Math.max(0, shown.length - 1));
    list.replaceChildren();
    shown.forEach(function (it, i) {
      var a = document.createElement(it.h ? "a" : "button");
      a.className = "pal-item"; a.setAttribute("role", "option"); a.id = "pal-" + i;
      a.setAttribute("aria-selected", i === act ? "true" : "false");
      if (it.h) a.href = /^(https?:|mailto:|\/)/.test(it.h) ? it.h : ROOT + it.h; else a.type = "button";
      var k = document.createElement("span"); k.className = "k"; k.textContent = it.k || "";
      var t = document.createElement("span"); t.className = "t"; t.textContent = it.t;
      a.append(k, t);
      if (it.d) { var d = document.createElement("span"); d.className = "d"; d.textContent = it.d; a.appendChild(d); }
      a.addEventListener("click", function (e) { if (it.a) { e.preventDefault(); close(); it.a(); } else close(); });
      a.addEventListener("mousemove", function () { if (act !== i) { act = i; mark(); } });
      list.appendChild(a);
    });
    inp.setAttribute("aria-activedescendant", shown.length ? "pal-" + act : "");
    count.textContent = shown.length ? shown.length + (shown.length === 60 ? "+" : "") + " results" : "No results";
  }
  function mark() { $$(".pal-item", list).forEach(function (x, i) { x.setAttribute("aria-selected", i === act ? "true" : "false"); }); var el = document.getElementById("pal-" + act); if (el) el.scrollIntoView({ block: "nearest" }); inp.setAttribute("aria-activedescendant", "pal-" + act); }
  function open() { if (!pal) return; lastFocus = document.activeElement; pal.hidden = false; inp.value = ""; act = 0; render(); load().then(render); setTimeout(function () { inp.focus(); }, 10); }
  function close() { if (!pal || pal.hidden) return; pal.hidden = true; if (lastFocus && lastFocus.focus) lastFocus.focus(); }
  window.KSpalette = open;
  var kbtn = $("#kbtn"); if (kbtn) kbtn.addEventListener("click", open);
  if (pal) {
    pal.addEventListener("click", function (e) { if (e.target === pal) close(); });
    inp.addEventListener("input", function () { act = 0; render(); });
    inp.addEventListener("keydown", function (e) {
      if (e.key === "ArrowDown") { e.preventDefault(); act = Math.min(shown.length - 1, act + 1); mark(); }
      else if (e.key === "ArrowUp") { e.preventDefault(); act = Math.max(0, act - 1); mark(); }
      else if (e.key === "Enter") { e.preventDefault(); var el = document.getElementById("pal-" + act); if (el) el.click(); }
      else if (e.key === "Tab") { e.preventDefault(); }
    });
  }
  document.addEventListener("keydown", function (e) {
    if ((e.metaKey || e.ctrlKey) && (e.key === "k" || e.key === "K")) { e.preventDefault(); if (pal && !pal.hidden) close(); else open(); }
    else if (e.key === "Escape") { close(); if (links && links.classList.contains("open")) { links.classList.remove("open"); menuBtn.setAttribute("aria-expanded", "false"); } }
  });
})();
