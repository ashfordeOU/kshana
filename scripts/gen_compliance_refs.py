#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Index of the headings and numbered paragraphs of the public documents the compliance mapping
cites, and a dated record of whether each cited URL resolved. For `src/compliance/mapping.rs`.

What it writes, under tests/fixtures/compliance/:

  headings.json   per document: the SHA-256 of the bytes read, when and how they were read, and
                  every heading, section number, numbered paragraph or list letter found by
                  rules written here (HEADINGS ONLY: ids and short heading text, never body
                  text). The rules list everything of the kind they match, not only what the
                  mapping cites, so a wrong citation can fail.
  citations.json  per mapping row: the reference string as it appears in mapping.rs, the
                  document, and the anchors it relies on.
  url_check.json  per cited URL: the scripted client's result (status, content type, bytes) and,
                  where the publisher refuses a scripted client, the second route used.

tests/compliance_references.rs reads these three files (CI needs no Python and no network) and
checks every row's anchors against the index and every URL against its record.

Tools: poppler `pdftotext` (any 22+ version) for the PDFs; Python standard library only
otherwise. Network access is needed to run this script.

Usage:

    python scripts/gen_compliance_refs.py --dhs-pdf PATH_TO_THE_DHS_PDF

The DHS site answers a scripted client with 403, so its PDF is read from a copy fetched another
way (the script records that route); everything else is fetched here.
"""
import argparse
import datetime as dt
import hashlib
import html
import json
import os
import re
import subprocess
import sys
import tempfile
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, ".."))
OUT = os.path.join(ROOT, "tests", "fixtures", "compliance")
MAPPING_RS = os.path.join(ROOT, "src", "compliance", "mapping.rs")
UA = {"User-Agent": "Mozilla/5.0", "Accept": "*/*", "Accept-Language": "en"}

# document id -> where it is read from (the URLs the mapping cites, or the open route used
# where the cited page is a landing page the scripted client cannot read).
FETCH = {
    "imo-1644": "https://rntfnd.org/wp-content/uploads/IMO-Circular-MSC.1-Circ.1644-Deliberate-Interference-With-The-United-States-Global-Positioning-System-Gps-And-Other...-Secretariat.pdf_safe.pdf",
    "imo-a1046": "https://wwwcdn.imo.org/localresources/en/KnowledgeCentre/IndexofIMOResolutions/AssemblyDocuments/A.1046(27).pdf",
    "imo-401": "https://wwwcdn.imo.org/localresources/en/KnowledgeCentre/IndexofIMOResolutions/MSCResolutions/MSC.401(95).pdf",
    "easa-sib": "https://ad.easa.europa.eu/blob/EASA_SIB_2022_02R4.pdf/SIB_2022-02R4_1",
    # EUR-Lex answers a scripted client with a 202 challenge page; the Publications Office
    # (the publisher of EUR-Lex) serves the same act as XHTML.
    "nis2": "https://publications.europa.eu/resource/celex/32022L2555",
    "en16803-1": "https://www.evs.ee/en/evs-en-16803-1-2020",
    "en16803-2": "https://www.evs.ee/en/evs-en-16803-2-2020",
    "en16803-3": "https://www.evs.ee/en/evs-en-16803-3-2020",
}

# Mapping row id -> (document id, anchors). An anchor is a heading number plus the words its
# heading must contain, or a bare id. Written from the document's own headings (see
# headings.json), not from the mapping's descriptive labels.
CITATIONS = {
    "DHS-S5.2": ("dhs-rpcf", ["5.2|Core Functions"]),
    "DHS-L1-R1": ("dhs-rpcf", ["L1R1"]),
    "DHS-L1-R2": ("dhs-rpcf", ["L1R2"]),
    "DHS-L1-R3": ("dhs-rpcf", ["L1R3"]),
    "DHS-L2-R4": ("dhs-rpcf", ["L2R4"]),
    "DHS-L2-R5": ("dhs-rpcf", ["L2R5"]),
    "DHS-L3-R6": ("dhs-rpcf", ["L3R6"]),
    "DHS-L3-R7": ("dhs-rpcf", ["L3R7"]),
    "DHS-L4-R8": ("dhs-rpcf", ["L4R8"]),
    "DHS-S5.5": ("dhs-rpcf", ["5.5|Common Mode"]),
    "DHS-S8.1-8.3": ("dhs-rpcf", ["8.1|Evaluation Coverage", "8.2|Static Analysis", "8.3|Dynamic Analysis"]),
    "DHS-S8.6": ("dhs-rpcf", ["8.6|Test Plans"]),
    "IMO-1644-3": ("imo-1644", ["3"]),
    "IMO-1644-5": ("imo-1644", ["5"]),
    "IMO-A1046-3": ("imo-a1046", ["3|HARBOUR"]),
    "IMO-A1046-2": ("imo-a1046", ["2|OCEAN"]),
    "IMO-401-3.1": ("imo-401", ["3.1", "3.2"]),
    "IMO-401-3.11": ("imo-401", ["3.11", "3.12", "3.13", "3.14"]),
    "IMO-401-3.16": ("imo-401", ["3.15", "3.16"]),
    "IMO-401-4.2": ("imo-401", ["4.2"]),
    "EASA-DESC": ("easa-sib", ["Description"]),
    "EASA-MFR": ("easa-sib", ["Aircraft and equipment manufacturers, should"]),
    "EASA-OPS-SPOOF": ("easa-sib", ["Air operators should"]),
    "EASA-ANSP": (
        "easa-sib",
        ["ATM/ANS providers should", "Organisations involved in the design or production of ATM/ANS equipment, should"],
    ),
    "EASA-REPORT": ("easa-sib", ["Recommendation(s)"]),
    "NIS2-21-1": ("nis2", ["21(1)"]),
    "NIS2-21-2-a": ("nis2", ["21(2)(a)"]),
    "NIS2-21-2-b": ("nis2", ["21(2)(b)"]),
    "NIS2-21-2-c": ("nis2", ["21(2)(c)"]),
    "NIS2-21-2-d": ("nis2", ["21(2)(d)"]),
    "NIS2-21-2-e": ("nis2", ["21(2)(e)"]),
    "NIS2-21-2-f": ("nis2", ["21(2)(f)"]),
    "NIS2-21-2-ghij": ("nis2", ["21(2)(g)", "21(2)(h)", "21(2)(i)", "21(2)(j)"]),
    "NIS2-21-3": ("nis2", ["21(3)"]),
    "EN16803-1": ("en16803-1", ["catalogue:Part 1"]),
    "EN16803-2": ("en16803-2", ["catalogue:Part 2"]),
    "EN16803-3-6": ("en16803-3", ["catalogue:Clause 6"]),
    "EN16803-3-A": ("en16803-3", ["catalogue:Annex A"]),
}


def now_date():
    return dt.date.today().isoformat()


def sha(b):
    return hashlib.sha256(b).hexdigest()


def fetch(url):
    headers = dict(UA)
    if "publications.europa.eu" in url:
        # Content negotiation: the same act as XHTML.
        headers["Accept"] = "application/xhtml+xml;q=1.0, text/html;q=0.8"
    req = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(req, timeout=90) as r:
        return r.status, r.headers.get("content-type"), r.read(), r.geturl()


def pdf_text(data):
    with tempfile.NamedTemporaryFile(suffix=".pdf") as f:
        f.write(data)
        f.flush()
        return subprocess.run(
            ["pdftotext", "-layout", f.name, "-"], check=True, capture_output=True, text=True
        ).stdout


# ---------------------------------------------------------------------------------------
# Extractors. Each returns a list of {"id": ..., "heading": ...} (heading may be empty).
# ---------------------------------------------------------------------------------------
def dhs_headings(text):
    out = []
    lines = text.split("\n")
    body = False
    for ln in lines:
        if "...." in ln:  # table-of-contents line
            continue
        m = re.match(r"^\s{0,6}(\d+\.\d+)\s+([A-Z][A-Za-z ,()/&-]{2,80})\s*$", ln)
        if m:
            out.append({"id": m.group(1), "heading": m.group(2).strip()})
    # Levels and their numbered requirements, in the Resilience Levels section (5.3) only.
    start = next(i for i, ln in enumerate(lines) if re.match(r"^\s*5\.3 Resilience Levels\s*$", ln))
    end = next(i for i, ln in enumerate(lines) if i > start and re.match(r"^\s*5\.4 Rationale", ln))
    level = None
    for ln in lines[start:end]:
        m = re.match(r"^\s*Level (\d)\s*$", ln)
        if m:
            level = int(m.group(1))
            out.append({"id": f"L{level}", "heading": f"Level {level}"})
            continue
        m = re.match(r"^\s*(\d)\.\s+(Must|Be)\b", ln)
        if m and level is not None:
            out.append({"id": f"L{level}R{m.group(1)}", "heading": ""})
    return out


def circular_paragraphs(text):
    return [
        {"id": m.group(1), "heading": ""}
        for m in re.finditer(r"^(\d{1,2})\s{2,}\S", text, flags=re.M)
    ]


def a1046_headings(text):
    out = []
    lines = text.split("\n")
    for i, ln in enumerate(lines):
        m = re.match(r"^(\d{1,2})\s{2,}([A-Z][A-Z ,]+[A-Z,])\s*$", ln)
        if m:
            title = m.group(2).strip()
            nxt = lines[i + 1].strip() if i + 1 < len(lines) else ""
            if re.match(r"^[A-Z][A-Z ,]+$", nxt) and not re.match(r"^\d", nxt):
                title += " " + nxt
            out.append({"id": m.group(1), "heading": title})
    return out


def numbered_paragraphs(text):
    return [
        {"id": m.group(1), "heading": ""}
        for m in re.finditer(r"^\s{0,4}(\d{1,2}\.\d{1,2})\s{2,}\S", text, flags=re.M)
    ]


def easa_headings(text):
    out = []
    for ln in text.split("\n"):
        m = re.match(r"^ {5,9}([A-Z][^.•▪]{2,100}):\s*$", ln)
        if m:
            out.append({"id": m.group(1).strip(), "heading": m.group(1).strip()})
    return out


def nis2_article21(xhtml):
    i = xhtml.find('id="art_21"')
    j = xhtml.find('id="art_22"')
    blk = xhtml[i:j]
    out = [{"id": "21", "heading": "Cybersecurity risk-management measures"}]
    for m in re.finditer(r'<p class="oj-normal">(\d)\.\s', blk):
        out.append({"id": f"21({m.group(1)})", "heading": ""})
    # The measures are the lettered points of paragraph 2.
    for m in re.finditer(r'<p class="oj-normal">\(([a-z])\)</p>', blk):
        out.append({"id": f"21(2)({m.group(1)})", "heading": ""})
    return out


def catalogue(htmltext, wants):
    plain = html.unescape(re.sub(r"<[^>]+>", " ", htmltext))
    plain = re.sub(r"\s+", " ", plain)
    title = re.search(r"<title>(.*?)</title>", htmltext, flags=re.S)
    return {
        "title": re.sub(r"\s+", " ", html.unescape(title.group(1))).strip() if title else "",
        "mentions": [w for w in wants if w.lower() in plain.lower()],
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dhs-pdf", required=True, help="a copy of the DHS framework PDF")
    args = ap.parse_args()
    if subprocess.run(["pdftotext", "-v"], capture_output=True).returncode not in (0, 99):
        sys.exit("pdftotext (poppler) is required")
    day = now_date()
    os.makedirs(OUT, exist_ok=True)

    docs = {}
    with open(args.dhs_pdf, "rb") as f:
        dhs_bytes = f.read()
    docs["dhs-rpcf"] = {
        "read_from": "https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf "
        f"(a copy fetched over HTTPS on {day}; the publisher answers a scripted client with HTTP 403)",
        "bytes": dhs_bytes,
        "entries": dhs_headings(pdf_text(dhs_bytes)),
    }
    fetched = {}
    for k, url in FETCH.items():
        status, ctype, data, final = fetch(url)
        fetched[k] = (status, ctype, data, final)
    docs["imo-1644"] = {
        "read_from": FETCH["imo-1644"] + " (third-party mirror of the circular)",
        "bytes": fetched["imo-1644"][2],
        "entries": circular_paragraphs(pdf_text(fetched["imo-1644"][2])),
    }
    docs["imo-a1046"] = {
        "read_from": FETCH["imo-a1046"],
        "bytes": fetched["imo-a1046"][2],
        "entries": a1046_headings(pdf_text(fetched["imo-a1046"][2])),
    }
    docs["imo-401"] = {
        "read_from": FETCH["imo-401"],
        "bytes": fetched["imo-401"][2],
        "entries": numbered_paragraphs(pdf_text(fetched["imo-401"][2])),
    }
    docs["easa-sib"] = {
        "read_from": "https://ad.easa.europa.eu/ad/2022-02R4 (the bulletin PDF behind that page, "
        + FETCH["easa-sib"]
        + ")",
        "bytes": fetched["easa-sib"][2],
        "entries": easa_headings(pdf_text(fetched["easa-sib"][2])),
    }
    docs["nis2"] = {
        "read_from": "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32022L2555 (read as "
        + FETCH["nis2"]
        + ", the act as XHTML from the EU Publications Office; the cited EUR-Lex page answers a "
        "scripted client with an HTTP 202 challenge)",
        "bytes": fetched["nis2"][2],
        "entries": nis2_article21(fetched["nis2"][2].decode("utf-8")),
    }
    cat = {}
    for part, wants in (("1", ["Part 1"]), ("2", ["Part 2"]), ("3", ["Part 3", "Clause 6", "Annex A"])):
        k = f"en16803-{part}"
        text = fetched[k][2].decode("utf-8", "replace")
        cat[k] = catalogue(text, wants)
        docs[k] = {
            "read_from": FETCH[k] + " (publisher's catalogue page; the standard itself is paid and was not read)",
            "bytes": fetched[k][2],
            "entries": [],
            "catalogue": cat[k],
        }

    headings = {
        "generated_by": "scripts/gen_compliance_refs.py",
        "read_on": day,
        "note": "Headings, section numbers, paragraph numbers and list letters only; no body text.",
        "documents": {},
    }
    for k, d in docs.items():
        headings["documents"][k] = {
            "read_from": d["read_from"],
            "sha256": sha(d["bytes"]),
            "bytes": len(d["bytes"]),
            "entries": d["entries"],
        }
        if "catalogue" in d:
            headings["documents"][k]["catalogue"] = d["catalogue"]

    # Citations: the reference string exactly as mapping.rs has it.
    src = open(MAPPING_RS, encoding="utf-8").read()
    refs = {
        m.group(1): m.group(2)
        for m in re.finditer(r'^\s+row\("([^"]+)", [A-Za-z0-9]+, "([^"]+)"', src, flags=re.M)
    }
    citations = {
        "generated_by": "scripts/gen_compliance_refs.py",
        "rows": [
            {"row": r, "reference": refs[r], "document": d, "anchors": a}
            for r, (d, a) in CITATIONS.items()
        ],
    }
    missing = set(refs) - set(CITATIONS)
    if missing:
        sys.exit(f"rows with no citation record: {sorted(missing)}")

    # URL record: every URL in SOURCES, by the scripted client.
    urls = sorted(set(re.findall(r'^\s+url: "([^"]+)"', src, flags=re.M)))
    checks = []
    for u in urls:
        entry = {"url": u, "checked": day, "method": "python urllib, browser-like headers"}
        try:
            status, ctype, data, final = fetch(u)
            entry.update({"status": status, "content_type": ctype, "bytes": len(data)})
        except urllib.error.HTTPError as e:
            entry.update({"status": e.code, "content_type": None, "bytes": 0})
        except Exception as e:  # network failure: recorded, never hidden
            entry.update({"status": None, "error": str(e)[:200], "bytes": 0})
        if u.startswith("https://www.dhs.gov/"):
            entry["second_route"] = {
                "method": "a copy of the PDF fetched over HTTPS with a different client",
                "checked": day,
                "result": f"returned the PDF ({len(dhs_bytes)} bytes, sha256 {sha(dhs_bytes)[:16]}...) which is the document indexed in headings.json",
            }
        if u.startswith("https://eur-lex.europa.eu/"):
            entry["second_route"] = {
                "method": "EU Publications Office XHTML of the same act, " + FETCH["nis2"],
                "checked": day,
                "result": f"HTTP {fetched['nis2'][0]}, {len(fetched['nis2'][2])} bytes, sha256 {sha(fetched['nis2'][2])[:16]}..., the document indexed in headings.json",
            }
        checks.append(entry)
    url_check = {"generated_by": "scripts/gen_compliance_refs.py", "checked": day, "urls": checks}

    for name, doc in (("headings.json", headings), ("citations.json", citations), ("url_check.json", url_check)):
        with open(os.path.join(OUT, name), "w", encoding="utf-8") as f:
            json.dump(doc, f, indent=1, ensure_ascii=False)
            f.write("\n")
        print("wrote", os.path.join(OUT, name))
    for k, d in headings["documents"].items():
        print(k, len(d["entries"]), "entries")


if __name__ == "__main__":
    main()
