// SPDX-License-Identifier: AGPL-3.0-only
//! Reader for the ION (Institute of Navigation) GNSS (global navigation satellite system)
//! SDR (software-defined radio) Metadata Standard: the `.sdrx` XML file that describes how a
//! raw sample file is laid out, and the unpacking of that file into complex samples.
//!
//! The standard describes a sample file as a repetition of **blocks**; a block is an optional
//! header, `cycles` repetitions of a **chunk**, and an optional footer. A chunk is
//! `countwords` words of `sizeword` bytes each, in the stated byte order; inside it the
//! **lumps** repeat, each lump holding one sample period of every **stream** it lists, and the
//! bits a chunk cannot fill with whole lumps are padding at its head or its tail. A stream
//! sample is `packedbits` bits per component (two components, I and Q, for complex formats),
//! of which `quantization` bits carry the value, aligned to the left (most significant) or
//! right end of the slot, coded as two's complement, offset binary, sign-magnitude or a
//! single sign bit.
//!
//! This module reads the subset the LuGRE (Lunar GNSS Receiver Experiment) snapshots use and
//! refuses anything else with a stated reason: one lane, one stream per lump, complex `IQ` or
//! `QI` samples (or real `IF` samples), no block header or footer. Samples come out as the
//! integer levels the coding defines, held in `f64`: two's complement as the signed integer,
//! offset binary and sign-magnitude as the odd symmetric levels `±1, ±3, …`, a sign bit as
//! `±1`. The levels are exact, so a converter that writes them as 8-bit integers loses
//! nothing.
//!
//! Reference: ION GNSS SDR Metadata Standard, version 1.0 (Institute of Navigation, 2020),
//! <https://sdr.ion.org>.

use crate::sdr::Cf64;

/// One element of a parsed XML document.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct XmlElement {
    /// Element name.
    pub name: String,
    /// Attributes in document order.
    pub attrs: Vec<(String, String)>,
    /// Child elements in document order.
    pub children: Vec<XmlElement>,
    /// Concatenated character data directly inside the element, trimmed.
    pub text: String,
}

impl XmlElement {
    /// The value of attribute `key`.
    pub fn attr(&self, key: &str) -> Option<&str> {
        self.attrs
            .iter()
            .find(|(k, _)| k.eq_ignore_ascii_case(key))
            .map(|(_, v)| v.as_str())
    }

    /// The first child named `name` (case-insensitive).
    pub fn child(&self, name: &str) -> Option<&XmlElement> {
        self.children
            .iter()
            .find(|c| c.name.eq_ignore_ascii_case(name))
    }

    /// Every descendant (depth first, the element itself first) named `name`.
    pub fn find_all<'a>(&'a self, name: &str, out: &mut Vec<&'a XmlElement>) {
        if self.name.eq_ignore_ascii_case(name) {
            out.push(self);
        }
        for c in &self.children {
            c.find_all(name, out);
        }
    }

    /// The first descendant named `name`.
    pub fn find(&self, name: &str) -> Option<&XmlElement> {
        let mut v = Vec::new();
        self.find_all(name, &mut v);
        v.into_iter().next()
    }

    /// The trimmed text of child `name`.
    pub fn child_text(&self, name: &str) -> Option<&str> {
        self.child(name).map(|c| c.text.as_str())
    }
}

fn unescape(s: &str) -> String {
    s.replace("&lt;", "<")
        .replace("&gt;", ">")
        .replace("&quot;", "\"")
        .replace("&apos;", "'")
        .replace("&amp;", "&")
}

/// Parse an XML document into its root element. Handles the declaration, comments,
/// processing instructions, attributes in either quote, self-closing tags, character data
/// and the five predefined entities; that is all the metadata standard uses.
pub fn parse_xml(text: &str) -> Result<XmlElement, String> {
    let b = text.as_bytes();
    let mut i = 0;
    let mut stack: Vec<XmlElement> = vec![XmlElement::default()];
    while i < b.len() {
        if b[i] == b'<' {
            if text[i..].starts_with("<!--") {
                let end = text[i..].find("-->").ok_or("unterminated comment")?;
                i += end + 3;
            } else if text[i..].starts_with("<?") || text[i..].starts_with("<!") {
                let end = text[i..].find('>').ok_or("unterminated declaration")?;
                i += end + 1;
            } else if text[i..].starts_with("</") {
                let end = text[i..].find('>').ok_or("unterminated closing tag")?;
                let name = text[i + 2..i + end].trim();
                let el = stack.pop().ok_or("unbalanced closing tag")?;
                if el.name != name {
                    return Err(format!(
                        "closing tag </{name}> does not match <{}>",
                        el.name
                    ));
                }
                stack
                    .last_mut()
                    .ok_or(format!("closing tag </{name}> without an opening tag"))?
                    .children
                    .push(el);
                i += end + 1;
            } else {
                // Opening tag: find its end outside quotes.
                let mut j = i + 1;
                let mut quote: Option<u8> = None;
                while j < b.len() {
                    match (quote, b[j]) {
                        (None, b'"') | (None, b'\'') => quote = Some(b[j]),
                        (Some(q), c) if c == q => quote = None,
                        (None, b'>') => break,
                        _ => {}
                    }
                    j += 1;
                }
                if j >= b.len() {
                    return Err("unterminated tag".into());
                }
                let mut inner = &text[i + 1..j];
                let self_closing = inner.ends_with('/');
                if self_closing {
                    inner = &inner[..inner.len() - 1];
                }
                let name_end = inner
                    .find(|c: char| c.is_whitespace())
                    .unwrap_or(inner.len());
                let mut el = XmlElement {
                    name: inner[..name_end].to_string(),
                    ..Default::default()
                };
                let mut rest = inner[name_end..].trim_start();
                while !rest.is_empty() {
                    let eq = rest
                        .find('=')
                        .ok_or(format!("attribute without value in <{}>", el.name))?;
                    let key = rest[..eq].trim().to_string();
                    let after = rest[eq + 1..].trim_start();
                    let q = after.chars().next().ok_or("attribute value missing")?;
                    if q != '"' && q != '\'' {
                        return Err(format!("unquoted attribute {key} in <{}>", el.name));
                    }
                    let close = after[1..].find(q).ok_or("unterminated attribute value")?;
                    el.attrs.push((key, unescape(&after[1..1 + close])));
                    rest = after[close + 2..].trim_start();
                }
                if self_closing {
                    stack
                        .last_mut()
                        .ok_or("element outside the document")?
                        .children
                        .push(el);
                } else {
                    stack.push(el);
                }
                i = j + 1;
            }
        } else {
            let end = text[i..].find('<').map(|e| i + e).unwrap_or(b.len());
            let t = unescape(text[i..end].trim());
            if !t.is_empty() {
                let top = stack.last_mut().ok_or("text outside the document")?;
                if !top.text.is_empty() {
                    top.text.push(' ');
                }
                top.text.push_str(&t);
            }
            i = end;
        }
    }
    if stack.len() != 1 {
        return Err(format!("{} element(s) left open", stack.len() - 1));
    }
    let mut doc = stack.pop().unwrap_or_default();
    match doc.children.len() {
        1 => Ok(doc.children.remove(0)),
        n => Err(format!("expected one root element, found {n}")),
    }
}

/// A frequency element's value in hertz: its text scaled by its `format` attribute (`Hz`,
/// `kHz`, `MHz`, `GHz`; hertz when absent).
fn freq_hz(el: &XmlElement) -> Result<f64, String> {
    let v: f64 = el
        .text
        .trim()
        .parse()
        .map_err(|_| format!("<{}> is not a number: {:?}", el.name, el.text))?;
    let scale = match el.attr("format").map(|s| s.to_ascii_lowercase()) {
        None => 1.0,
        Some(f) if f == "hz" => 1.0,
        Some(f) if f == "khz" => 1e3,
        Some(f) if f == "mhz" => 1e6,
        Some(f) if f == "ghz" => 1e9,
        Some(f) => return Err(format!("unknown frequency format {f:?}")),
    };
    Ok(v * scale)
}

/// How a sample component's bits map to a level.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Encoding {
    /// Two's complement: the signed integer.
    TwosComplement,
    /// Offset binary: code `c` is the odd level `2c − (2^q − 1)`.
    OffsetBinary,
    /// Sign-magnitude, sign the most significant bit (one is negative): `±(2m + 1)`.
    SignMagnitude,
    /// A single sign bit: zero is `+1`, one is `−1`.
    Sign,
}

impl Encoding {
    fn parse(s: &str) -> Result<Self, String> {
        Ok(match s.trim().to_ascii_uppercase().as_str() {
            "TC" => Encoding::TwosComplement,
            "OB" => Encoding::OffsetBinary,
            "SM" | "SMV" => Encoding::SignMagnitude,
            "SIGN" => Encoding::Sign,
            other => return Err(format!("unsupported encoding {other:?}")),
        })
    }

    /// The level of the `q`-bit code `c`.
    pub fn level(self, c: u64, q: u32) -> f64 {
        match self {
            Encoding::TwosComplement => {
                if q > 0 && (c >> (q - 1)) & 1 == 1 {
                    c as f64 - (1u64 << q) as f64
                } else {
                    c as f64
                }
            }
            Encoding::OffsetBinary => 2.0 * c as f64 - ((1u64 << q) - 1) as f64,
            Encoding::SignMagnitude => {
                let m = c & ((1u64 << (q - 1)) - 1);
                let v = (2 * m + 1) as f64;
                if (c >> (q - 1)) & 1 == 1 {
                    -v
                } else {
                    v
                }
            }
            Encoding::Sign => {
                if c & 1 == 1 {
                    -1.0
                } else {
                    1.0
                }
            }
        }
    }
}

/// Sample format of a stream.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SampleFormat {
    /// Complex, in-phase component first.
    Iq,
    /// Complex, quadrature component first.
    Qi,
    /// Real samples.
    If,
}

/// The layout of one sample file, as its `.sdrx` metadata describes it.
#[derive(Clone, Debug, PartialEq)]
pub struct SdrLayout {
    /// Data file name (the `url` of the `file` element).
    pub url: String,
    /// Sample rate (Hz): the system base frequency times the stream's rate factor.
    pub sample_rate_hz: f64,
    /// Centre frequency of the band (Hz).
    pub center_freq_hz: f64,
    /// Frequency the band centre is translated to in the samples (Hz); zero for baseband.
    pub translated_freq_hz: f64,
    /// Bits carrying a component's value.
    pub quantization: u32,
    /// Bits allocated to a component.
    pub packed_bits: u32,
    /// Value aligned to the most significant end of its slot.
    pub align_left: bool,
    /// Sample format.
    pub format: SampleFormat,
    /// Component coding.
    pub encoding: Encoding,
    /// Bytes per word.
    pub word_bytes: usize,
    /// Words per chunk.
    pub words_per_chunk: usize,
    /// Most significant byte first.
    pub big_endian: bool,
    /// Unfilled chunk bits sit at the head (most significant end) rather than the tail.
    pub pad_head: bool,
    /// Samples per lump (the stream's rate factor).
    pub samples_per_lump: usize,
    /// Byte offset of the first chunk in the file.
    pub offset_bytes: usize,
}

impl SdrLayout {
    /// Bits per sample (all components).
    pub fn sample_bits(&self) -> usize {
        self.packed_bits as usize
            * if self.format == SampleFormat::If {
                1
            } else {
                2
            }
    }

    /// Whole samples in one chunk.
    pub fn samples_per_chunk(&self) -> usize {
        let chunk_bits = self.word_bytes * self.words_per_chunk * 8;
        let lump_bits = self.sample_bits() * self.samples_per_lump;
        (chunk_bits / lump_bits) * self.samples_per_lump
    }

    /// Bytes per chunk.
    pub fn chunk_bytes(&self) -> usize {
        self.word_bytes * self.words_per_chunk
    }

    /// Number of complete samples in a data file of `len` bytes.
    pub fn sample_count(&self, len: usize) -> usize {
        let body = len.saturating_sub(self.offset_bytes);
        (body / self.chunk_bytes()) * self.samples_per_chunk()
    }
}

/// Read the layout from the text of an `.sdrx` file. Refuses (with the reason) any layout
/// outside the subset the module documentation states.
pub fn parse_sdrx(text: &str) -> Result<SdrLayout, String> {
    let root = parse_xml(text)?;
    let mut streams = Vec::new();
    root.find_all("stream", &mut streams);
    let stream = match streams.as_slice() {
        [s] => *s,
        [] => return Err("no <stream> element".into()),
        _ => {
            return Err(format!(
                "{} streams: only single-stream files are read",
                streams.len()
            ))
        }
    };
    let mut blocks = Vec::new();
    root.find_all("block", &mut blocks);
    if blocks.len() > 1 {
        return Err("more than one <block>: only single-lane files are read".into());
    }
    if let Some(b) = blocks.first() {
        for k in ["sizeheader", "sizefooter"] {
            if let Some(v) = b.attr(k) {
                if v.trim().parse::<usize>().unwrap_or(1) != 0 {
                    return Err(format!("block {k}={v}: headers and footers are not read"));
                }
            }
        }
    }
    let chunk = root.find("chunk").ok_or("no <chunk> element")?;
    let num = |el: &XmlElement, key: &str| -> Result<usize, String> {
        el.attr(key)
            .ok_or(format!("<{}> lacks {key}", el.name))?
            .trim()
            .parse()
            .map_err(|_| format!("<{}> {key} is not an integer", el.name))
    };
    let word_bytes = num(chunk, "sizeword")?;
    let words_per_chunk = num(chunk, "countwords")?;
    let big_endian = !chunk
        .attr("endian")
        .is_some_and(|e| e.eq_ignore_ascii_case("little"));
    let pad_head = chunk
        .attr("padding")
        .is_some_and(|p| p.eq_ignore_ascii_case("head"));
    let text_of = |key: &str| -> Result<String, String> {
        stream
            .child_text(key)
            .map(str::to_string)
            .ok_or(format!("<stream> lacks <{key}>"))
    };
    let parse_u = |key: &str| -> Result<u32, String> {
        text_of(key)?
            .trim()
            .parse()
            .map_err(|_| format!("<{key}> is not an integer"))
    };
    let quantization = parse_u("quantization")?;
    let packed_bits = parse_u("packedbits")?;
    if quantization == 0 || quantization > packed_bits || packed_bits > 32 {
        return Err(format!(
            "quantization {quantization} in {packed_bits} packed bits"
        ));
    }
    let ratefactor = stream
        .child_text("ratefactor")
        .map(|t| {
            t.trim()
                .parse::<usize>()
                .map_err(|_| "<ratefactor> is not an integer")
        })
        .transpose()?
        .unwrap_or(1);
    let format = match text_of("format")?.trim().to_ascii_uppercase().as_str() {
        "IQ" => SampleFormat::Iq,
        "QI" => SampleFormat::Qi,
        "IF" => SampleFormat::If,
        other => return Err(format!("unsupported sample format {other:?}")),
    };
    let encoding = Encoding::parse(&text_of("encoding")?)?;
    let align_left = !stream
        .child_text("alignment")
        .is_some_and(|a| a.trim().eq_ignore_ascii_case("right"));
    let system = root.find("system").ok_or("no <system> element")?;
    let base = freq_hz(system.find("freqbase").ok_or("no <freqbase>")?)?;
    let band = stream
        .find("band")
        .or_else(|| root.find("band"))
        .ok_or("no <band> element")?;
    let center_freq_hz = freq_hz(band.child("centerfreq").ok_or("no <centerfreq>")?)?;
    let translated_freq_hz = band
        .child("translatedfreq")
        .map(freq_hz)
        .transpose()?
        .unwrap_or(0.0);
    let file = root.find("file").ok_or("no <file> element")?;
    let url = file
        .child_text("url")
        .ok_or("<file> lacks <url>")?
        .to_string();
    let offset_bytes = file
        .child_text("offset")
        .map(|t| {
            t.trim()
                .parse::<usize>()
                .map_err(|_| "<offset> is not an integer")
        })
        .transpose()?
        .unwrap_or(0);
    Ok(SdrLayout {
        url,
        sample_rate_hz: base * ratefactor as f64,
        center_freq_hz,
        translated_freq_hz,
        quantization,
        packed_bits,
        align_left,
        format,
        encoding,
        word_bytes,
        words_per_chunk,
        big_endian,
        pad_head,
        samples_per_lump: ratefactor,
        offset_bytes,
    })
}

/// Decode `n` complex samples starting at sample `start` from the raw file bytes `data`
/// laid out as `layout` describes (real `IF` samples come out with a zero imaginary part).
pub fn decode(
    layout: &SdrLayout,
    data: &[u8],
    start: usize,
    n: usize,
) -> Result<Vec<Cf64>, String> {
    let per_chunk = layout.samples_per_chunk();
    if per_chunk == 0 {
        return Err("a chunk holds no whole lump".into());
    }
    if start + n > layout.sample_count(data.len()) {
        return Err(format!(
            "samples {start}..{} requested, the file holds {}",
            start + n,
            layout.sample_count(data.len())
        ));
    }
    let chunk_bytes = layout.chunk_bytes();
    let chunk_bits = chunk_bytes * 8;
    let used_bits = per_chunk * layout.sample_bits();
    let head_pad = if layout.pad_head {
        chunk_bits - used_bits
    } else {
        0
    };
    let pb = layout.packed_bits as usize;
    let q = layout.quantization;
    let mut out = Vec::with_capacity(n);
    let mut chunk_buf: Vec<u8> = Vec::with_capacity(chunk_bytes);
    let mut cur_chunk = usize::MAX;
    for s in start..start + n {
        let c = s / per_chunk;
        if c != cur_chunk {
            // Normalise the chunk to most-significant-byte-first words.
            let at = layout.offset_bytes + c * chunk_bytes;
            chunk_buf.clear();
            for w in data[at..at + chunk_bytes].chunks_exact(layout.word_bytes) {
                if layout.big_endian {
                    chunk_buf.extend_from_slice(w);
                } else {
                    chunk_buf.extend(w.iter().rev());
                }
            }
            cur_chunk = c;
        }
        let bit0 = head_pad + (s % per_chunk) * layout.sample_bits();
        let read = |bit: usize| -> u64 {
            let mut v = 0u64;
            for k in 0..pb {
                let b = bit + k;
                v = (v << 1) | ((chunk_buf[b / 8] >> (7 - b % 8)) & 1) as u64;
            }
            let code = if layout.align_left {
                v >> (pb as u32 - q)
            } else {
                v & ((1u64 << q) - 1)
            };
            code
        };
        let a = layout.encoding.level(read(bit0), q);
        let sample = match layout.format {
            SampleFormat::If => Cf64::new(a, 0.0),
            SampleFormat::Iq => Cf64::new(a, layout.encoding.level(read(bit0 + pb), q)),
            SampleFormat::Qi => Cf64::new(layout.encoding.level(read(bit0 + pb), q), a),
        };
        out.push(sample);
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    const META: &str = r#"<?xml version="1.0"?>
<!-- a hand-written example in the shape of the standard -->
<metadata>
  <system id="S"><freqbase format="MHz">8</freqbase></system>
  <file><url>snap.bin</url></file>
  <lane id="L">
    <block cycles="1" sizeheader="0" sizefooter="0">
      <chunk sizeword="1" countwords="3" endian="Big" padding="Tail">
        <lump>
          <stream id="L1">
            <ratefactor>1</ratefactor>
            <quantization>4</quantization>
            <packedbits>4</packedbits>
            <alignment>Left</alignment>
            <format>IQ</format>
            <encoding>TC</encoding>
            <band id="L1"><centerfreq format="MHz">1575.42</centerfreq>
              <translatedfreq format="Hz">0</translatedfreq></band>
          </stream>
        </lump>
      </chunk>
    </block>
  </lane>
</metadata>"#;

    #[test]
    fn parses_the_layout() {
        let l = parse_sdrx(META).unwrap();
        assert_eq!(l.url, "snap.bin");
        assert_eq!(l.sample_rate_hz, 8e6);
        assert_eq!(l.center_freq_hz, 1_575_420_000.0);
        assert_eq!(l.quantization, 4);
        assert_eq!(l.format, SampleFormat::Iq);
        assert_eq!(l.encoding, Encoding::TwosComplement);
        assert_eq!(l.samples_per_chunk(), 3);
    }

    #[test]
    fn decodes_hand_packed_nibbles() {
        let l = parse_sdrx(META).unwrap();
        // I = +7, Q = −8; I = −1, Q = 0; I = +1, Q = −2.
        let bytes = [0x78u8, 0xF0, 0x1E, 0x12, 0x34, 0x56];
        let s = decode(&l, &bytes, 0, 6).unwrap();
        let want = [
            (7.0, -8.0),
            (-1.0, 0.0),
            (1.0, -2.0),
            (1.0, 2.0),
            (3.0, 4.0),
            (5.0, 6.0),
        ];
        for (g, w) in s.iter().zip(want) {
            assert_eq!((g.re, g.im), w);
        }
        assert_eq!(decode(&l, &bytes, 4, 2).unwrap(), s[4..6].to_vec());
        assert!(decode(&l, &bytes, 5, 2).is_err());
    }

    #[test]
    fn encodings_give_the_stated_levels() {
        assert_eq!(Encoding::OffsetBinary.level(0, 2), -3.0);
        assert_eq!(Encoding::OffsetBinary.level(3, 2), 3.0);
        assert_eq!(Encoding::SignMagnitude.level(0b10, 2), -1.0);
        assert_eq!(Encoding::SignMagnitude.level(0b01, 2), 3.0);
        assert_eq!(Encoding::Sign.level(1, 1), -1.0);
        assert_eq!(Encoding::TwosComplement.level(0b1000, 4), -8.0);
    }

    #[test]
    fn little_endian_words_and_right_alignment() {
        let meta = META
            .replace(
                r#"sizeword="1" countwords="3" endian="Big""#,
                r#"sizeword="2" countwords="1" endian="Little""#,
            )
            .replace("<packedbits>4</packedbits>", "<packedbits>8</packedbits>")
            .replace(
                "<alignment>Left</alignment>",
                "<alignment>Right</alignment>",
            );
        let l = parse_sdrx(&meta).unwrap();
        // One 16-bit little-endian word 0x0F03 → bytes 0F 03 most significant first.
        let s = decode(&l, &[0x03, 0x0F], 0, 1).unwrap();
        assert_eq!((s[0].re, s[0].im), (-1.0, 3.0));
    }

    #[test]
    fn refuses_what_it_does_not_read() {
        assert!(parse_sdrx(&META.replace("sizeheader=\"0\"", "sizeheader=\"16\"")).is_err());
        assert!(
            parse_sdrx(&META.replace("<encoding>TC</encoding>", "<encoding>XX</encoding>"))
                .is_err()
        );
        assert!(parse_xml("<a><b></a>").is_err());
    }
}
