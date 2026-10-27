// The evidence label a run's result carries: `result.evidence` = { tier, matrix, id_rule, rows: [{ id, requirement, status }] }.
// The engine writes it from the verification matrix (kshana >= the evidence-labels release); `tier` is the weakest status among
// the rows. A run recorded by an older engine has no such key: every function here then returns null / the input unchanged,
// so an old recorded run shows no badge and no error.
//
//   evidenceOf(result)           -> the label, normalised, or null
//   badgeModel(result)           -> what the badge shows (pure data, for the tests), or null
//   renderBadge(doc, result)     -> a DOM element (chip + "N ledger rows" + the rows on hover, focus or tap), or null
//   csvHeader(label)             -> the two `# evidence:` comment lines, byte for byte as the engine writes them
//   withEvidenceCsv(csv, result) -> a CSV that says its tier: engine CSVs already carry the lines and are returned as they are
import { t } from "./t.mjs";
export const EVIDENCE_KEY = "evidence";
const TIERS = ["VALIDATED", "MODELLED", "PARTNER"];

export function evidenceOf(result) {
  const e = result && typeof result === "object" ? result[EVIDENCE_KEY] : null;
  if (!e || typeof e !== "object") return null;
  const tier = String(e.tier || "").toUpperCase();
  if (!TIERS.includes(tier)) return null;
  const rows = (Array.isArray(e.rows) ? e.rows : []).filter((r) => r && typeof r === "object").map((r) => ({ id: String(r.id || ""), requirement: String(r.requirement || ""), status: String(r.status || "").toUpperCase() }));
  return { tier, matrix: String(e.matrix || ""), id_rule: String(e.id_rule || ""), rows };
}

export const tierClass = (tier) => String(tier || "").toLowerCase();
export const countText = (n) => t("js-lib-evidence-ledger-rows", { one: "{ $n } ledger row", other: "{ $n } ledger rows" }, { n });

export function badgeModel(result) {
  const e = evidenceOf(result);
  if (!e) return null;
  return { tier: e.tier, cls: tierClass(e.tier), count: e.rows.length, countText: countText(e.rows.length), rows: e.rows, matrix: e.matrix };
}

// The same text as src/evidence_label.rs `csv_header`: "# evidence: <tier> rows <id;id;…>" and "# evidence-matrix: <matrix> (<rule>)".
export function csvHeader(label) {
  const e = label && label.rows ? label : evidenceOf({ evidence: label });
  if (!e) return "";
  return `# evidence: ${e.tier} rows ${e.rows.map((r) => r.id).join(";")}\n# evidence-matrix: ${e.matrix} (${e.id_rule})\n`;
}

export function withEvidenceCsv(csv, result) {
  if (typeof csv !== "string") return csv;
  if (csv.startsWith("# evidence:")) return csv;
  const e = evidenceOf(result);
  return e ? csvHeader(e) + csv : csv;
}

// Put the badge in `host` (replacing what was there); nothing at all when the result has no label. `result` may be the engine's
// result or a page model that carries its `evidence` key.
export function mountBadge(host, result, doc = host && host.ownerDocument) {
  if (!host) return false;
  host.replaceChildren();
  const b = renderBadge(doc, result);
  if (b) host.append(b);
  return !!b;
}

// The badge. `doc` is a document (or anything with createElement); the element has no dependencies and is styled by evidence.css.
export function renderBadge(doc, result) {
  const m = badgeModel(result);
  if (!m) return null;
  const el = (tag, cls, text) => { const x = doc.createElement(tag); if (cls) x.className = cls; if (text != null) x.textContent = text; return x; };
  const root = el("span", `evb evb-${m.cls}`);
  root.setAttribute("tabindex", "0");
  root.setAttribute("role", "group");
  root.setAttribute("aria-label", t("js-lib-evidence-aria", "Evidence: { $tier }, { $count }", { tier: m.tier, count: m.countText }));
  const chip = el("span", "evb-chip"); chip.append(el("i"), m.tier);
  root.append(chip, el("span", "evb-n", m.countText));
  const pop = el("span", "evb-pop"); pop.setAttribute("role", "tooltip");
  pop.append(el("b", "", t("js-lib-evidence-rows-behind", "Ledger rows behind this result")));
  const ul = el("ul");
  for (const r of m.rows) {
    const li = el("li");
    li.append(el("code", "", r.id), el("span", "evb-req", r.requirement), el("em", `evb-st evb-${tierClass(r.status)}`, r.status));
    ul.append(li);
  }
  pop.append(ul);
  if (m.matrix) pop.append(el("small", "", m.matrix));
  root.append(pop);
  return root;
}
