// SPDX-License-Identifier: AGPL-3.0-only
// Tests for what chart markup is allowed into the page (svgsafe.mjs). Run with `node lib/svgsafe.test.mjs`.
// The tree here is a plain stand-in for a parsed XML document; the same functions run on the real
// one in the browser (checked in a browser by site-next/scratch/port/check_svgsafe.mjs).
import assert from "node:assert/strict";
import { hasDeclaration, sanitizeSvg } from "./svgsafe.mjs";

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
    el("style", {}, [], ".c-line{fill:none}.g{fill:url(#grad)}"),
    el("animate", { attributeName: "opacity", values: "0;1", dur: "1s" }),
    el("path", { style: "fill:url( '#grad' )", d: "M0 0" }),
  ]);
  assert.equal(sanitizeSvg(root), 0);
  assert.deepEqual(names(root), ["g", "use", "style", "animate", "path"]);
  assert.deepEqual(attrNames(root), ["viewBox", "width", "style", "class"]);
  assert.deepEqual(attrNames(root.children[1]), ["href", "xlink:href"]);
}

// Scripts and embedded documents are removed wherever they sit, with what they contain.
{
  const root = el("svg", {}, [
    el("script", {}, [], "x()"),
    el("g", {}, [el("foreignObject", {}, [el("iframe", {})]), el("path", { d: "M0 0" })]),
    ...["object", "embed", "audio", "video", "canvas", "link", "meta", "base"].map((n) => el(n, {})),
    el("SCRIPT", {}),
  ]);
  assert.equal(sanitizeSvg(root), 11);
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
  assert.equal(sanitizeSvg(ok), 0);
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
