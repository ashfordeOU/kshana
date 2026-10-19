// SPDX-License-Identifier: AGPL-3.0-only
// What a page needs to show the replay's skyplot and vessel glyph: the colour variables the drawing uses, mapped once
// to the Studio's tokens, and the drawing's own rules. Makes no request. The Bridge replay page does the same
// for its own larger drawing (replay/replay.js).
import { SKY_CSS } from "./skydraw.mjs";

export const PAGE_VARS = `:root{--rp-bg:var(--surface);--rp-ink:var(--ink);--rp-ink2:var(--ink-2);--rp-ink3:var(--ink-3);--rp-line:var(--line);--rp-line2:var(--line-2);--rp-mono:var(--f-mono);--rp-sky:var(--surface-2);
--rp-un:var(--int);--rp-tim:var(--tim);--rp-nav:var(--nav);--rp-spf:var(--spf);--rp-orb:var(--orb)}`;
export function ensureSkyCss(doc = document) {
  if (doc.getElementById("sky-css")) return;
  const st = doc.createElement("style");
  st.id = "sky-css"; st.textContent = PAGE_VARS + SKY_CSS;
  doc.head.append(st);
}
