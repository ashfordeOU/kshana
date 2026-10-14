// SPDX-License-Identifier: AGPL-3.0-only
//! A small XML reader and writer for the CCSDS Navigation Data Messages in NDM/XML (CCSDS
//! 505.0-B): elements, attributes, character data, comments, processing instructions and the
//! five predefined entities plus numeric character references. No DTD, no namespaces beyond
//! keeping prefixed names as written. Enough for the flat, schema-defined NDM messages; not a
//! general XML processor.

/// One XML element: its name, attributes, child elements and text (character data of the
/// element itself, concatenated and trimmed).
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Element {
    /// Tag name as written.
    pub name: String,
    /// Attributes in document order.
    pub attrs: Vec<(String, String)>,
    /// Child elements in document order.
    pub children: Vec<Element>,
    /// Trimmed character data directly inside the element.
    pub text: String,
}

impl Element {
    /// The first child named `name`.
    pub fn child(&self, name: &str) -> Option<&Element> {
        self.children.iter().find(|c| c.name == name)
    }

    /// Every child named `name`.
    pub fn children_named<'a>(&'a self, name: &'a str) -> impl Iterator<Item = &'a Element> + 'a {
        self.children.iter().filter(move |c| c.name == name)
    }

    /// The text of the first child named `name`.
    pub fn child_text(&self, name: &str) -> Option<&str> {
        self.child(name).map(|c| c.text.as_str())
    }

    /// The value of attribute `name`.
    pub fn attr(&self, name: &str) -> Option<&str> {
        self.attrs
            .iter()
            .find(|(k, _)| k == name)
            .map(|(_, v)| v.as_str())
    }
}

fn unescape(s: &str) -> Result<String, String> {
    let mut out = String::with_capacity(s.len());
    let mut rest = s;
    while let Some(i) = rest.find('&') {
        out.push_str(&rest[..i]);
        let j = rest[i..]
            .find(';')
            .ok_or_else(|| format!("unterminated entity in {s:?}"))?;
        let ent = &rest[i + 1..i + j];
        match ent {
            "lt" => out.push('<'),
            "gt" => out.push('>'),
            "amp" => out.push('&'),
            "quot" => out.push('"'),
            "apos" => out.push('\''),
            _ if ent.starts_with("#x") || ent.starts_with("#X") => {
                let c = u32::from_str_radix(&ent[2..], 16)
                    .ok()
                    .and_then(char::from_u32)
                    .ok_or_else(|| format!("bad character reference &{ent};"))?;
                out.push(c);
            }
            _ if ent.starts_with('#') => {
                let c = ent[1..]
                    .parse::<u32>()
                    .ok()
                    .and_then(char::from_u32)
                    .ok_or_else(|| format!("bad character reference &{ent};"))?;
                out.push(c);
            }
            _ => return Err(format!("unknown entity &{ent};")),
        }
        rest = &rest[i + j + 1..];
    }
    out.push_str(rest);
    Ok(out)
}

/// Escape character data or an attribute value.
pub fn escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}

struct Parser<'a> {
    s: &'a str,
    pos: usize,
}

impl<'a> Parser<'a> {
    fn rest(&self) -> &'a str {
        &self.s[self.pos..]
    }

    fn skip_misc(&mut self) -> Result<(), String> {
        loop {
            let r = self.rest();
            let t = r.trim_start();
            self.pos += r.len() - t.len();
            if t.starts_with("<?") {
                let e = t.find("?>").ok_or("unterminated processing instruction")?;
                self.pos += e + 2;
            } else if t.starts_with("<!--") {
                let e = t.find("-->").ok_or("unterminated comment")?;
                self.pos += e + 3;
            } else if t.starts_with("<!") {
                let e = t.find('>').ok_or("unterminated declaration")?;
                self.pos += e + 1;
            } else {
                return Ok(());
            }
        }
    }

    fn element(&mut self) -> Result<Element, String> {
        let r = self.rest();
        if !r.starts_with('<') {
            return Err(format!("expected an element at byte {}", self.pos));
        }
        let end = r.find('>').ok_or("unterminated start tag")?;
        let mut tag = &r[1..end];
        let empty = tag.ends_with('/');
        if empty {
            tag = &tag[..tag.len() - 1];
        }
        self.pos += end + 1;
        let name_end = tag.find(|c: char| c.is_whitespace()).unwrap_or(tag.len());
        let name = tag[..name_end].to_string();
        let mut attrs = Vec::new();
        let mut a = tag[name_end..].trim();
        while !a.is_empty() {
            let eq = a
                .find('=')
                .ok_or_else(|| format!("bad attribute in <{name}>"))?;
            let key = a[..eq].trim().to_string();
            let v = a[eq + 1..].trim_start();
            let q = v.chars().next().ok_or("attribute without a value")?;
            if q != '"' && q != '\'' {
                return Err(format!("unquoted attribute {key} in <{name}>"));
            }
            let close = v[1..].find(q).ok_or("unterminated attribute value")?;
            attrs.push((key, unescape(&v[1..1 + close])?));
            a = v[close + 2..].trim_start();
        }
        let mut el = Element {
            name,
            attrs,
            children: Vec::new(),
            text: String::new(),
        };
        if empty {
            return Ok(el);
        }
        let mut text = String::new();
        loop {
            let r = self.rest();
            let lt = r
                .find('<')
                .ok_or_else(|| format!("<{}> is not closed", el.name))?;
            text.push_str(&unescape(&r[..lt])?);
            self.pos += lt;
            let r = self.rest();
            if r.starts_with("</") {
                let e = r.find('>').ok_or("unterminated end tag")?;
                let close = r[2..e].trim();
                if close != el.name {
                    return Err(format!("</{close}> closes <{}>", el.name));
                }
                self.pos += e + 1;
                el.text = text.trim().to_string();
                return Ok(el);
            } else if r.starts_with("<!--") {
                let e = r.find("-->").ok_or("unterminated comment")?;
                self.pos += e + 3;
            } else if r.starts_with("<![CDATA[") {
                let e = r.find("]]>").ok_or("unterminated CDATA")?;
                text.push_str(&r[9..e]);
                self.pos += e + 3;
            } else if r.starts_with("<?") {
                let e = r.find("?>").ok_or("unterminated processing instruction")?;
                self.pos += e + 2;
            } else {
                el.children.push(self.element()?);
            }
        }
    }
}

/// Parse a document and return its root element.
pub fn parse(text: &str) -> Result<Element, String> {
    let mut p = Parser { s: text, pos: 0 };
    p.skip_misc()?;
    let root = p.element()?;
    p.skip_misc()?;
    if !p.rest().trim().is_empty() {
        return Err("content after the root element".into());
    }
    Ok(root)
}

/// An indenting writer of simple element trees.
#[derive(Default)]
pub struct Writer {
    out: String,
    depth: usize,
}

impl Writer {
    /// A writer that starts with the XML declaration.
    pub fn new() -> Self {
        Writer {
            out: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n".into(),
            depth: 0,
        }
    }

    fn indent(&mut self) {
        for _ in 0..self.depth {
            self.out.push_str("  ");
        }
    }

    /// Open `<name attrs>`.
    pub fn open(&mut self, name: &str, attrs: &[(&str, &str)]) {
        self.indent();
        self.out.push('<');
        self.out.push_str(name);
        for (k, v) in attrs {
            self.out.push_str(&format!(" {k}=\"{}\"", escape(v)));
        }
        self.out.push_str(">\n");
        self.depth += 1;
    }

    /// Close `</name>`.
    pub fn close(&mut self, name: &str) {
        self.depth -= 1;
        self.indent();
        self.out.push_str(&format!("</{name}>\n"));
    }

    /// `<name>text</name>`.
    pub fn leaf(&mut self, name: &str, text: &str) {
        self.indent();
        self.out
            .push_str(&format!("<{name}>{}</{name}>\n", escape(text)));
    }

    /// `<name attrs>text</name>`.
    pub fn open_leaf(&mut self, name: &str, attrs: &[(&str, &str)], text: &str) {
        self.indent();
        self.out.push('<');
        self.out.push_str(name);
        for (k, v) in attrs {
            self.out.push_str(&format!(" {k}=\"{}\"", escape(v)));
        }
        self.out.push_str(&format!(">{}</{name}>\n", escape(text)));
    }

    /// The document.
    pub fn finish(self) -> String {
        self.out
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_elements_attributes_entities_and_comments() {
        let doc = r#"<?xml version="1.0"?>
<!-- c -->
<aem id="CCSDS_AEM_VERS" version='2.0'>
  <header><COMMENT>a &amp; b &lt;x&gt; &#65;&#x42;</COMMENT><X/></header>
  <!-- inside -->
  <body><Q1 units="1/s"> 0.5 </Q1></body>
</aem>"#;
        let r = parse(doc).unwrap();
        assert_eq!(r.name, "aem");
        assert_eq!(r.attr("version"), Some("2.0"));
        let h = r.child("header").unwrap();
        assert_eq!(h.child_text("COMMENT"), Some("a & b <x> AB"));
        assert!(h.child("X").unwrap().children.is_empty());
        let q = r.child("body").unwrap().child("Q1").unwrap();
        assert_eq!((q.text.as_str(), q.attr("units")), ("0.5", Some("1/s")));
        assert!(parse("<a><b></a>").is_err());
        assert!(parse("<a></a><b/>").is_err());
    }

    #[test]
    fn writer_round_trips() {
        let mut w = Writer::new();
        w.open("r", &[("id", "x\"y")]);
        w.leaf("A", "1 < 2 & 3");
        w.close("r");
        let r = parse(&w.finish()).unwrap();
        assert_eq!(r.attr("id"), Some("x\"y"));
        assert_eq!(r.child_text("A"), Some("1 < 2 & 3"));
    }
}
