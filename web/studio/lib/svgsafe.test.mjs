// SPDX-License-Identifier: AGPL-3.0-only
// Tests for what chart markup is allowed into the page (svgsafe.mjs). Run with `node lib/svgsafe.test.mjs`.
// The tree here is a plain stand-in for a parsed XML document; the same functions run on the real
// one in the browser: the last section below adopts every vector into a real parsed XML document in
// Chromium, with and without the sanitiser (it runs when Playwright and a Chromium are found, see there).
import assert from "node:assert/strict";
import { hasDeclaration, parseSvgMarkup, sanitizeSvg, MAX_SVG_BYTES } from "./svgsafe.mjs";

// A stand-in element with the interface sanitizeSvg uses.
function el(name, attrs = {}, kids = [], text = "") {
  const node = {
    localName: name,
    parent: null,
    attributes: Object.entries(attrs).map(([n, value]) => ({ name: n, localName: n.includes(":") ? n.split(":")[1] : n, value })),
    children: kids,
    textContent: text,
    getAttribute(n) { const a = node.attributes.find((x) => x.name === n); return a ? a.value : null; },
    removeAttribute(n) { node.attributes = node.attributes.filter((x) => x.name !== n); },
    remove() { node.parent.children = node.parent.children.filter((c) => c !== node); },
  };
  kids.forEach((k) => { k.parent = node; });
  return node;
}
const names = (n) => n.children.map((c) => c.localName);
const attrNames = (n) => n.attributes.map((a) => a.name);

// Declarations: a document type, and anything that defines something, is refused before parsing.
for (const m of ['<!DOCTYPE svg [<!ENTITY a "x">]><svg/>', "<!doctype svg><svg/>", '<svg><!ENTITY a "b"></svg>', "<!ELEMENT a ANY>", "<!  DOCTYPE x>", "<!ATTLIST a b CDATA #IMPLIED>", "<!NOTATION n SYSTEM 'x'>"]) {
  assert.equal(hasDeclaration(m), true, m);
}
for (const m of ['<svg xmlns="http://www.w3.org/2000/svg"><text>a &amp; b</text></svg>', "<svg><!-- a comment --><g/></svg>", "<svg><text>DOCTYPE in text</text></svg>"]) {
  assert.equal(hasDeclaration(m), false, m);
}

// Drawing is kept exactly as it is.
{
  const root = el("svg", { viewBox: "0 0 10 10", width: "10", style: "fill:#fff", class: "c-bg" }, [
    el("g", { transform: "translate(1 2)" }, [el("path", { d: "M0 0L1 1", stroke: "var(--s-tim)" }), el("text", { x: "1", y: "2" }, [], "label")]),
    el("use", { href: "#icon", "xlink:href": "#icon" }),
    el("animate", { attributeName: "opacity", values: "0;1", dur: "1s" }),
    el("path", { style: "fill:url( '#grad' )", d: "M0 0" }),
  ]);
  assert.equal(sanitizeSvg(root), 0);
  assert.deepEqual(names(root), ["g", "use", "animate", "path"]);
  assert.deepEqual(attrNames(root), ["viewBox", "width", "style", "class"]);
  assert.deepEqual(attrNames(root.children[1]), ["href", "xlink:href"]);
}

// Scripts and embedded documents are removed wherever they sit, with what they contain.
{
  const root = el("svg", {}, [
    el("script", {}, [], "x()"),
    el("g", {}, [el("foreignObject", {}, [el("iframe", {})]), el("path", { d: "M0 0" })]),
    ...["object", "embed", "audio", "video", "canvas", "link", "meta", "base", "style"].map((n) => el(n, {})),
    el("SCRIPT", {}),
  ]);
  assert.equal(sanitizeSvg(root), 12);
  assert.deepEqual(names(root), ["g"]);
  assert.deepEqual(names(root.children[0]), ["path"]);
}

// Event handlers go, in any case and with any prefix; the rest of the element stays.
{
  const root = el("svg", { onload: "a()", width: "1" }, [
    el("g", { onclick: "a()", OnMouseOver: "a()", "x:onfocus": "a()", id: "k" }, [el("image", { onerror: "a()", width: "1" })]),
  ]);
  assert.equal(sanitizeSvg(root), 5);
  assert.deepEqual(attrNames(root), ["width"]);
  assert.deepEqual(attrNames(root.children[0]), ["id"]);
  assert.deepEqual(attrNames(root.children[0].children[0]), ["width"]);
}

// A link stays only when it points inside the file; script addresses are caught however they are spelled.
{
  const keep = ["#a", " #a", "#"];
  const drop = ["https://other.example/x", "http://other.example/x", "//other.example/x", "data:image/svg+xml,<svg/>", "javascript:alert(1)", " javascript:alert(1)", "java\tscript:alert(1)", "JaVaScRiPt:alert(1)", "x.svg#a", "a.svg", ""];
  for (const v of keep) { const r = el("svg", {}, [el("use", { href: v }), el("a", { "xlink:href": v })]); assert.equal(sanitizeSvg(r), 0, JSON.stringify(v)); }
  for (const v of drop) {
    const r = el("svg", {}, [el("use", { href: v }), el("a", { "xlink:href": v }), el("image", { href: v, width: "1" })]);
    assert.equal(sanitizeSvg(r), 3, JSON.stringify(v));
    assert.deepEqual(attrNames(r.children[2]), ["width"]);
  }
  // A script address in any other attribute is dropped too.
  const r = el("svg", {}, [el("a", { to: "javascript:alert(1)", id: "k" })]);
  assert.equal(sanitizeSvg(r), 1);
  assert.deepEqual(attrNames(r.children[0]), ["id"]);
  // src is never drawing.
  const s = el("svg", {}, [el("image", { src: "#a", width: "1" })]);
  assert.equal(sanitizeSvg(s), 1);
}

// Styles that fetch or run something go; styles that point inside the file stay.
{
  const bad = ["fill:url(https://other.example/x.png)", "fill:url( 'http://other.example/x' )", "background:url(data:image/png;base64,AA)", "fill:expression(alert(1))", "@import 'x'", "fill:javascript:alert(1)"];
  for (const v of bad) {
    const r = el("svg", {}, [el("g", { style: v, id: "k" }), el("style", {}, [], v)]);
    assert.equal(sanitizeSvg(r), 2, v);
    assert.deepEqual(names(r), ["g"]);
    assert.deepEqual(attrNames(r.children[0]), ["id"]);
  }
  const ok = el("svg", {}, [el("g", { style: "fill:url(#g);stroke:var(--s-tim)" }), el("style", {}, [], ".a{fill:url('#g')}")]);
  assert.equal(sanitizeSvg(ok), 1, "the style element goes even when harmless, the attribute stays");
  assert.deepEqual(names(ok), ["g"]);
  assert.deepEqual(attrNames(ok.children[0]), ["style"]);
}

// Any attribute that names a url( keeps only url(#id): paint, filters, masks, clips, markers, cursors,
// animated values.
{
  const names_ = ["fill", "stroke", "filter", "mask", "clip-path", "marker-start", "marker-mid", "marker-end", "cursor", "values", "to", "from", "by", "data-x"];
  const outside = ["url(https://other.example/x)", "url( 'http://other.example/x' )", 'url("//other.example/x")', "url(data:image/png;base64,AA)", "url(x.svg#a)", "url(a.cur), auto", "URL(https://other.example/x)", "url(#a) url(https://other.example/x)", "url(#a", "url("];
  const inside = ["url(#a)", "url( '#a' )", 'url("#a")', "URL(#a)", "url(#a) url(#b)"];
  for (const n of names_) {
    for (const v of outside) {
      const r = el("svg", {}, [el("rect", { [n]: v, id: "k" })]);
      assert.equal(sanitizeSvg(r), 1, `${n}=${v}`);
      assert.deepEqual(attrNames(r.children[0]), ["id"], `${n}=${v}`);
    }
    for (const v of inside) {
      const r = el("svg", {}, [el("rect", { [n]: v, id: "k" })]);
      assert.equal(sanitizeSvg(r), 0, `${n}=${v}`);
    }
  }
  // Animated values go through the same rule.
  const a = el("svg", {}, [el("animate", { attributeName: "fill", values: "url(#a);url(https://other.example/x)" })]);
  assert.equal(sanitizeSvg(a), 1);
  assert.deepEqual(attrNames(a.children[0]), ["attributeName"]);
}

// A style element is never adopted, whatever it holds.
for (const css of [".a{fill:none}", "", ".a{fill:url(#g)}", "@import 'x'", ".a{background:url(https://other.example/x)}"]) {
  const r = el("svg", {}, [el("style", {}, [], css), el("g", {}, [el("style", {}, [], css)]), el("path", { d: "M0 0" })]);
  assert.equal(sanitizeSvg(r), 2, css);
  assert.deepEqual(names(r), ["g", "path"]);
  assert.deepEqual(names(r.children[0]), []);
}

// Animation that aims at a handler, a link or a style is removed; animation of drawing is kept.
{
  const aimed = ["onclick", "onload", "href", "xlink:href", "style", "src", "OnClick"];
  for (const t of aimed) {
    const r = el("svg", {}, [el("animate", { attributeName: t, values: "a;b" }), el("set", { attributeName: t, to: "b" }), el("animateTransform", { attributeName: t }), el("animateMotion", { attributeName: t })]);
    assert.equal(sanitizeSvg(r), 4, t);
    assert.deepEqual(names(r), []);
  }
  const fine = el("svg", {}, [el("animate", { attributeName: "opacity" }), el("set", { attributeName: "fill", to: "red" }), el("animateTransform", { attributeName: "transform" }), el("animateMotion", { path: "M0 0" })]);
  assert.equal(sanitizeSvg(fine), 0);
}

// It reaches the whole tree, and a second pass finds nothing left.
{
  let deep = el("path", { d: "M0 0", onload: "a()" });
  for (let i = 0; i < 40; i++) deep = el("g", i % 2 ? { onclick: "a()" } : {}, [deep, el("script", {})]);
  const root = el("svg", {}, [deep]);
  assert.equal(sanitizeSvg(root), 1 + 40 + 20);
  assert.equal(sanitizeSvg(root), 0);
}
console.log("svgsafe.test.mjs: all assertions passed");

// Entity-expansion bombs ("billion laughs", quadratic blow-up, external entities) never reach the parser.
{
  let parsed = 0;
  class Spy { parseFromString(m) { parsed++; return { documentElement: { nodeName: "svg", markup: m } }; } }
  const lol = '<?xml version="1.0"?><!DOCTYPE lolz [<!ENTITY lol "lol"><!ENTITY lol2 "&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;"><!ENTITY lol3 "&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;">]><svg xmlns="http://www.w3.org/2000/svg"><text>&lol3;</text></svg>';
  const quad = '<!DOCTYPE s [<!ENTITY a "' + "x".repeat(1000) + '">]><svg><text>' + "&a;".repeat(1000) + "</text></svg>";
  const ext = '<!DOCTYPE s [<!ENTITY x SYSTEM "file:///etc/passwd">]><svg><text>&x;</text></svg>';
  const spaced = "<!\n DOCTYPE s []><svg/>", mixed = "<!DoCtYpE s><svg/>", odd = "<!FOO bar><svg/>", cdataLike = "<![ACDATA[x]]><svg/>";
  for (const bomb of [lol, quad, ext, spaced, mixed, odd, cdataLike]) {
    assert.equal(hasDeclaration(bomb), true, bomb.slice(0, 40));
    assert.equal(parseSvgMarkup(bomb, Spy), null, bomb.slice(0, 40));
  }
  assert.equal(parsed, 0, "no bomb reached the parser");
  assert.ok(parseSvgMarkup('<svg xmlns="http://www.w3.org/2000/svg"><!-- fine --><g><![CDATA[x]]></g></svg>', Spy), "plain drawing parses");
  assert.equal(parsed, 1);
  for (const bad of [null, undefined, 5, {}, "x".repeat(MAX_SVG_BYTES + 1)]) assert.equal(parseSvgMarkup(bad, Spy), null);
  assert.equal(parseSvgMarkup("<svg/>", undefined), globalThis.DOMParser ? parseSvgMarkup("<svg/>") : null);
  class NotSvg { parseFromString() { return { documentElement: { nodeName: "html" } }; } }
  assert.equal(parseSvgMarkup("<html/>", NotSvg), null);
  assert.equal(parsed, 1);
}
console.log("svgsafe.test.mjs: entity-expansion checks passed");

// ---- Browser section: each vector is adopted twice into a real parsed XML document, untouched (the
// control, which must run its handler, so this can fail) and through sanitizeSvg (which must not).
// It needs Playwright and a Chromium: PLAYWRIGHT_MODULE (default /opt/node-tools/node_modules) and,
// optionally, CHROMIUM (the browser's path). Where Playwright is not installed the section says so and
// the node checks above stand alone; set SVGSAFE_BROWSER=1 to make a missing browser a failure.
import { createRequire } from "node:module";
import fs from "node:fs";
let chromium = null;
try {
  chromium = createRequire((process.env.PLAYWRIGHT_MODULE || "/opt/node-tools/node_modules") + "/")("playwright").chromium;
} catch {
  if (process.env.SVGSAFE_BROWSER === "1") { console.error("FAIL: SVGSAFE_BROWSER=1 and Playwright is not installed"); process.exit(1); }
  console.log("svgsafe.test.mjs: browser section NOT run (Playwright not found; set PLAYWRIGHT_MODULE)");
}
if (chromium) {
  const NS = 'xmlns="http://www.w3.org/2000/svg"';
  const vectors = {
    "image handler": `<svg ${NS}><image href="x" onerror="window.__p=1"/></svg>`,
    "handler in a text run": `<svg ${NS}><text>a</text><image href="x" onerror="window.__p=1"/><text>b</text></svg>`,
    "embedded document": `<svg ${NS}><foreignObject><body xmlns="http://www.w3.org/1999/xhtml"><img src="x" onerror="window.__p=1"/></body></foreignObject></svg>`,
    "animated handler": `<svg ${NS}><image href="x"><set attributeName="onerror" to="window.__p=1"/></image></svg>`,
    "script element": `<svg ${NS}><script>window.__p=1</script></svg>`,
    "script address": `<svg ${NS}><a href="javascript:window.__p=1"><text>x</text></a></svg>`,
    "outside paint": `<svg ${NS}><rect width="5" height="5" fill="url(https://other.example/x.svg#p)"/></svg>`,
    "outside filter and cursor": `<svg ${NS}><rect width="5" height="5" filter="url(https://other.example/x.svg#f)" cursor="url(https://other.example/c.cur), auto"/></svg>`,
    "animated outside value": `<svg ${NS}><rect width="5" height="5"><animate attributeName="fill" values="url(https://other.example/x.svg#p)"/></rect></svg>`,
    "style element": `<svg ${NS}><style>rect{fill:url(https://other.example/x.svg#p)}</style><rect width="5" height="5"/></svg>`,
    "outside link": `<svg ${NS}><image href="https://other.example/x.png" onerror="window.__p=1"/></svg>`,
  };
  const source = fs.readFileSync(new URL("./svgsafe.mjs", import.meta.url), "utf8").replace(/^export /gm, "") + "\nwindow.svgsafe = { hasDeclaration, sanitizeSvg };";
  const browser = await chromium.launch(process.env.CHROMIUM ? { executablePath: process.env.CHROMIUM } : {});
  // A page of its own for every adoption, so a handler that fires late cannot be counted for another input.
  async function fresh() {
    const page = await browser.newPage();
    await page.setContent("<!doctype html><div id=box></div>");
    await page.addScriptTag({ content: source });
    return page;
  }

  // Adopt as the Studio does (app.js svgNode), with or without the sanitiser.
  const adopt = (page, markup, clean) => page.evaluate(({ markup, clean }) => {
    window.__p = 0;
    if (window.svgsafe.hasDeclaration(markup)) return { drawn: false, why: "declaration" };
    const root = new DOMParser().parseFromString(markup, "image/svg+xml").documentElement;
    if (!root || root.nodeName !== "svg") return { drawn: false, why: "not svg" };
    if (clean) window.svgsafe.sanitizeSvg(root);
    const box = document.getElementById("box");
    box.replaceChildren(document.importNode(root, true));
    // What is left that could run or load something, counted on the live tree (text is not markup).
    let bad = 0;
    for (const e of box.querySelectorAll("*")) {
      if (/^(script|foreignobject|iframe|object|embed|audio|video|canvas|link|meta|base|style)$/i.test(e.localName)) bad++;
      for (const a of e.attributes) {
        if (/^on/i.test(a.name) || (a.localName.toLowerCase() === "href" && !/^\s*#/.test(a.value)) || /javascript\s*:/i.test(a.value.replace(/[\u0000-\u0020]+/g, "")) || /url\(\s*['"]?\s*[^#'"\s)]/i.test(a.value)) bad++;
      }
    }
    return { drawn: true, bad };
  }, { markup, clean });

  const failures = [];
  let controls = 0;
  for (const [name, markup] of Object.entries(vectors)) {
    const rawPage = await fresh();
    const raw = await adopt(rawPage, markup, false);
    const injected = raw.drawn && raw.bad > 0;
    await rawPage.waitForTimeout(200);
    const ran = (await rawPage.evaluate(() => window.__p)) === 1;
    await rawPage.close();
    if (injected && ran) controls++;
    const cleanPage = await fresh();
    const clean = await adopt(cleanPage, markup, true);
    await cleanPage.waitForTimeout(200);
    const ranClean = (await cleanPage.evaluate(() => window.__p)) === 1;
    await cleanPage.close();
    const ok = clean.drawn && !ranClean && clean.bad === 0;
    console.log(`${ok ? "ok  " : "FAIL"} ${name}: control ${raw.drawn ? `${raw.bad} live item(s)${ran ? ", handler ran" : ""}` : raw.why}; sanitised ${clean.drawn ? `${clean.bad} left${ranClean ? ", HANDLER RAN" : ""}` : clean.why}`);
    if (!ok) failures.push(name);
  }
  await browser.close();
  if (controls === 0) { console.error("FAIL: no control vector ran its handler, so this check could not have failed"); process.exit(1); }
  if (failures.length) { console.error(`FAIL: ${failures.length} vector(s) not neutralised`); process.exit(1); }
  console.log(`svgsafe.test.mjs: browser section: ${Object.keys(vectors).length} vectors inert after sanitising; ${controls} controls ran their handler untouched`);

}
