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
//! sample is `packedbits` bits, all components together (a complex sample gives I and Q half
//! each), of which `quantization` bits per component carry the value, coded as two's
//! complement, offset binary, sign-magnitude or a single sign bit. The settings may be given
//! as attributes or as child elements; a stream's band may be a reference to a top-level
//! band of the same identifier.
//!
//! Byte and bit order follow the chunk's `endian`: a little-endian word is read least
//! significant byte first AND filled from its least significant bit upward (the first
//! component of the first sample in the lowest bits), a big-endian word from its most
//! significant bit downward. For the LuGRE (Lunar GNSS Receiver Experiment) snapshots, one
//! byte per complex sample with `endian` Little, this puts I in the low nibble and Q in the
//! high one; the receiver's interface control document says only "IQ interleaved", and a
//! swap of the two would conjugate the signal, mirroring every Doppler.
//!
//! This module reads the subset the LuGRE snapshots use and refuses anything else with a
//! stated reason: one lane, one stream, complex `IQ` or `QI` samples (or real `IF` samples),
//! one block spanning the file, whose header and footer bytes are skipped. Samples come out
//! as the integer levels the coding defines, held in `f64`: two's complement as the signed
//! integer, offset binary and sign-magnitude as the odd symmetric levels `±1, ±3, …`, a sign
//! bit as `±1`. The levels are exact, so a converter that writes them as 8-bit integers loses
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
    /// Bits allocated to one sample, all its components together (the standard's
    /// `packedbits`); a complex sample gives each component half.
    pub packed_bits: u32,
    /// Value aligned to the most significant end of its component slot.
    pub align_left: bool,
    /// Sample format.
    pub format: SampleFormat,
    /// Component coding.
    pub encoding: Encoding,
    /// Bytes per word.
    pub word_bytes: usize,
    /// Words per chunk.
    pub words_per_chunk: usize,
    /// Little-endian words. The byte order of a word, and also the order in which samples
    /// fill it: a little-endian word is filled from its least significant bit upward (the
    /// first component of the first sample in the lowest bits), a big-endian word from its
    /// most significant bit downward.
    pub little_endian: bool,
    /// Unfilled chunk bits come first in fill order rather than last.
    pub pad_head: bool,
    /// Samples per lump (the stream's rate factor).
    pub samples_per_lump: usize,
    /// Bytes before the first chunk (the block header and any file offset).
    pub header_bytes: usize,
    /// Bytes after the last chunk (the block footer).
    pub footer_bytes: usize,
}

impl SdrLayout {
    /// Bits per sample (all components).
    pub fn sample_bits(&self) -> usize {
        self.packed_bits as usize
    }

    /// Bits per component slot.
    pub fn component_bits(&self) -> usize {
        match self.format {
            SampleFormat::If => self.packed_bits as usize,
            _ => self.packed_bits as usize / 2,
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
        let body = len.saturating_sub(self.header_bytes + self.footer_bytes);
        (body / self.chunk_bytes()) * self.samples_per_chunk()
    }
}

/// A setting given either as an attribute of `el` or as the text of its child element of the
/// same name (the standard's schema uses child elements; both appear in the wild).
fn setting<'a>(el: &'a XmlElement, key: &str) -> Option<&'a str> {
    el.attr(key).or_else(|| el.child_text(key)).map(str::trim)
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
    let int = |el: &XmlElement, key: &str| -> Result<Option<usize>, String> {
        setting(el, key)
            .map(|v| {
                v.parse::<usize>()
                    .map_err(|_| format!("<{}> {key} is not an integer: {v:?}", el.name))
            })
            .transpose()
    };
    let (mut header_bytes, mut footer_bytes) = (0, 0);
    if let Some(b) = blocks.first() {
        header_bytes = int(b, "sizeheader")?.unwrap_or(0);
        footer_bytes = int(b, "sizefooter")?.unwrap_or(0);
        let cycles = int(b, "cycles")?.unwrap_or(0);
        if cycles != 0 && (header_bytes != 0 || footer_bytes != 0) {
            return Err(format!(
                "a block of {cycles} cycles with a header or footer repeats; only a single \
                 block spanning the file is read"
            ));
        }
    }
    let chunk = root.find("chunk").ok_or("no <chunk> element")?;
    let word_bytes = int(chunk, "sizeword")?.ok_or("<chunk> lacks sizeword")?;
    let words_per_chunk = int(chunk, "countwords")?.ok_or("<chunk> lacks countwords")?;
    if word_bytes == 0 || word_bytes > 8 || words_per_chunk == 0 {
        return Err(format!(
            "chunk of {words_per_chunk} words of {word_bytes} bytes"
        ));
    }
    let little_endian = setting(chunk, "endian").is_some_and(|e| e.eq_ignore_ascii_case("little"));
    let pad_head = setting(chunk, "padding").is_some_and(|p| p.eq_ignore_ascii_case("head"));
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
    let slot = if format == SampleFormat::If {
        packed_bits
    } else {
        packed_bits / 2
    };
    if quantization == 0
        || quantization > slot
        || slot > 32
        || (format != SampleFormat::If && packed_bits % 2 != 0)
    {
        return Err(format!(
            "quantization {quantization} in {packed_bits} packed bits per sample"
        ));
    }
    let encoding = Encoding::parse(&text_of("encoding")?)?;
    let align_left = stream
        .child_text("alignment")
        .is_some_and(|a| a.trim().eq_ignore_ascii_case("left"));
    let system = root.find("system").ok_or("no <system> element")?;
    let freqbase = {
        let mut systems = Vec::new();
        root.find_all("system", &mut systems);
        systems
            .iter()
            .find_map(|s| s.child("freqbase"))
            .ok_or("no <freqbase>")?
    };
    let _ = system;
    let base = freq_hz(freqbase)?;
    // The stream names its band; the band's frequencies may sit in a top-level <band> of the
    // same id.
    let band_ref = stream.find("band");
    let mut bands = Vec::new();
    root.find_all("band", &mut bands);
    let band = bands
        .iter()
        .copied()
        .find(|b| {
            b.child("centerfreq").is_some()
                && match band_ref.and_then(|r| r.attr("id")) {
                    Some(id) => b.attr("id") == Some(id),
                    None => true,
                }
        })
        .ok_or("no <band> with a <centerfreq> for the stream")?;
    let center_freq_hz = freq_hz(band.child("centerfreq").ok_or("no <centerfreq>")?)?;
    let translated_freq_hz = band
        .child("translatedfreq")
        .map(freq_hz)
        .transpose()?
        .unwrap_or(0.0);
    let mut files = Vec::new();
    root.find_all("file", &mut files);
    let file = files
        .iter()
        .find(|f| f.child("url").is_some())
        .ok_or("no <file> with a <url>")?;
    let url = file.child_text("url").unwrap_or_default().to_string();
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
        little_endian,
        pad_head,
        samples_per_lump: ratefactor,
        header_bytes: header_bytes + offset_bytes,
        footer_bytes,
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
    let total = layout.sample_count(data.len());
    if start + n > total {
        return Err(format!(
            "samples {start}..{} requested, the file holds {total}",
            start + n
        ));
    }
    let chunk_bytes = layout.chunk_bytes();
    let word_bits = layout.word_bytes * 8;
    let chunk_bits = chunk_bytes * 8;
    let used_bits = per_chunk * layout.sample_bits();
    let head_pad = if layout.pad_head {
        chunk_bits - used_bits
    } else {
        0
    };
    let cb = layout.component_bits();
    let q = layout.quantization;
    let mut words: Vec<u64> = Vec::with_capacity(layout.words_per_chunk);
    let mut cur_chunk = usize::MAX;
    let mut out = Vec::with_capacity(n);
    for s in start..start + n {
        let c = s / per_chunk;
        if c != cur_chunk {
            let at = layout.header_bytes + c * chunk_bytes;
            words.clear();
            for w in data[at..at + chunk_bytes].chunks_exact(layout.word_bytes) {
                let mut v = 0u64;
                if layout.little_endian {
                    for &byte in w.iter().rev() {
                        v = (v << 8) | byte as u64;
                    }
                } else {
                    for &byte in w {
                        v = (v << 8) | byte as u64;
                    }
                }
                words.push(v);
            }
            cur_chunk = c;
        }
        // Fill-order bit `g` of the chunk: little-endian words fill from bit 0 up, big-endian
        // words from the top bit down.
        let bit = |g: usize| -> u64 {
            let (w, k) = (g / word_bits, g % word_bits);
            let pos = if layout.little_endian {
                k
            } else {
                word_bits - 1 - k
            };
            (words[w] >> pos) & 1
        };
        let component = |g0: usize| -> f64 {
            let mut slot = 0u64;
            for k in 0..cb {
                if layout.little_endian {
                    slot |= bit(g0 + k) << k;
                } else {
                    slot = (slot << 1) | bit(g0 + k);
                }
            }
            let code = if layout.align_left {
                slot >> (cb as u32 - q)
            } else {
                slot & ((1u64 << q) - 1)
            };
            layout.encoding.level(code, q)
        };
        let g0 = head_pad + (s % per_chunk) * layout.sample_bits();
        let a = component(g0);
        out.push(match layout.format {
            SampleFormat::If => Cf64::new(a, 0.0),
            SampleFormat::Iq => Cf64::new(a, component(g0 + cb)),
            SampleFormat::Qi => Cf64::new(component(g0 + cb), a),
        });
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The shape of a LuGRE `.sdrx` file: settings as child elements, a header and footer,
    /// the band referenced by id, one byte per complex sample.
    const META: &str = r#"<?xml version="1.0" encoding="utf-8"?>
<metadata xmlns="http://www.ion.org/standards/sdrwg/schema/metadata.xsd">
   <comment format="text">a hand-written example</comment>
   <lane id="Lane">
      <system id="System"/>
      <block id="Block00">
         <chunk id="Chunk00">
            <sizeword>1</sizeword>
            <countwords>1</countwords>
            <endian>Little</endian>
            <padding>None</padding>
            <lump id="Lump00">
               <stream id="Stream00">
                  <ratefactor>1</ratefactor>
                  <quantization>4</quantization>
                  <packedbits>8</packedbits>
                  <alignment>Undefined</alignment>
                  <format>IQ</format>
                  <encoding>TC</encoding>
                  <band id="L1"/>
               </stream>
            </lump>
         </chunk>
         <cycles>0</cycles>
         <sizeheader>2</sizeheader>
         <sizefooter>1</sizefooter>
      </block>
   </lane>
   <system id="System"><freqbase format="MHz">8</freqbase></system>
   <band id="L1"><centerfreq format="MHz">1575.420</centerfreq>
      <translatedfreq format="MHz">0</translatedfreq></band>
   <band id="L5"><centerfreq format="MHz">1176.450</centerfreq></band>
   <file id="File"><url>snap.bin</url><lane id="Lane"/></file>
</metadata>"#;

    #[test]
    fn parses_the_layout() {
        let l = parse_sdrx(META).unwrap();
        assert_eq!(l.url, "snap.bin");
        assert_eq!(l.sample_rate_hz, 8e6);
        assert_eq!(l.center_freq_hz, 1_575_420_000.0);
        assert_eq!(l.quantization, 4);
        assert_eq!(l.component_bits(), 4);
        assert_eq!(l.format, SampleFormat::Iq);
        assert_eq!(l.encoding, Encoding::TwosComplement);
        assert!(l.little_endian);
        assert_eq!((l.header_bytes, l.footer_bytes), (2, 1));
        assert_eq!(l.samples_per_chunk(), 1);
        assert_eq!(l.sample_count(10), 7);
    }

    #[test]
    fn decodes_little_endian_nibbles_low_first() {
        let l = parse_sdrx(META).unwrap();
        // Header AA BB; samples: low nibble I, high nibble Q; footer CC.
        // 0x87: I = 7, Q = −8. 0x0F: I = −1, Q = 0. 0xE1: I = 1, Q = −2.
        let bytes = [0xAAu8, 0xBB, 0x87, 0x0F, 0xE1, 0xCC];
        let s = decode(&l, &bytes, 0, 3).unwrap();
        let want = [(7.0, -8.0), (-1.0, 0.0), (1.0, -2.0)];
        for (g, w) in s.iter().zip(want) {
            assert_eq!((g.re, g.im), w);
        }
        assert_eq!(decode(&l, &bytes, 1, 2).unwrap(), s[1..3].to_vec());
        assert!(decode(&l, &bytes, 2, 2).is_err());
    }

    #[test]
    fn big_endian_words_fill_from_the_top_bit() {
        let meta = META
            .replace("<sizeword>1</sizeword>", "<sizeword>2</sizeword>")
            .replace("<endian>Little</endian>", "<endian>Big</endian>")
            .replace("<sizeheader>2</sizeheader>", "<sizeheader>0</sizeheader>")
            .replace("<sizefooter>1</sizefooter>", "<sizefooter>0</sizefooter>");
        let l = parse_sdrx(&meta).unwrap();
        assert_eq!(l.samples_per_chunk(), 2);
        // Word 0x78F0: first sample I = 7, Q = −8; second I = −1, Q = 0.
        let s = decode(&l, &[0x78, 0xF0], 0, 2).unwrap();
        assert_eq!((s[0].re, s[0].im, s[1].re, s[1].im), (7.0, -8.0, -1.0, 0.0));
    }

    #[test]
    fn eight_bit_components_in_sixteen_bit_samples() {
        let meta = META
            .replace(
                "<quantization>4</quantization>",
                "<quantization>8</quantization>",
            )
            .replace("<packedbits>8</packedbits>", "<packedbits>16</packedbits>")
            .replace("<sizeword>1</sizeword>", "<sizeword>2</sizeword>");
        let l = parse_sdrx(&meta).unwrap();
        // Little-endian 16-bit word bytes [0x05, 0xFD] = 0xFD05: I = 0x05, Q = 0xFD = −3.
        let s = decode(&l, &[0, 0, 0x05, 0xFD, 0], 0, 1).unwrap();
        assert_eq!((s[0].re, s[0].im), (5.0, -3.0));
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
    fn refuses_what_it_does_not_read() {
        assert!(parse_sdrx(&META.replace("<cycles>0</cycles>", "<cycles>4</cycles>")).is_err());
        assert!(
            parse_sdrx(&META.replace("<encoding>TC</encoding>", "<encoding>XX</encoding>"))
                .is_err()
        );
        assert!(parse_sdrx(
            &META.replace("<packedbits>8</packedbits>", "<packedbits>6</packedbits>")
        )
        .is_err());
        assert!(parse_xml("<a><b></a>").is_err());
    }
}
