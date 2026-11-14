// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell, before first paint: the theme remembered by this window (the Studio's
// key, so both follow one choice) and the density. An external file because the window's content security
// policy allows scripts from the app only.
try {
  var kt = localStorage.getItem("kshana-theme");
  if (kt === "dark" || kt === "light") document.documentElement.dataset.theme = kt;
} catch (e) { /* no storage: the system theme */ }
// The density (Comfortable or Compact, lib/look.mjs), before first paint as well.
try {
  document.documentElement.dataset.density = localStorage.getItem("kshana-desk-density") === "compact" ? "compact" : "comfortable";
} catch (e) { document.documentElement.dataset.density = "comfortable"; }
